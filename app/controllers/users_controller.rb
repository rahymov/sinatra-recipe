class UsersController < ApplicationController
  # use Rack::Session::Pool, :expire_after => 1800
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/create_user', locals: {message: "Please sign up before you sign in"}
    else
      redirect to '/'
    end
  end

  post '/signup' do
    if params[:full_name] == "" || params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
      flash[:error] = "Can't be blank."
    else
      @user = User.new(full_name: params[:full_name], username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      session[:notice] = "Successfully signed up."
      redirect to '/'
    end
  end

  get '/login' do
    if !session[:user_id]
      erb :'users/login'
    else
      redirect to '/home'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "you are logged in."
      redirect "/"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      flash[:message] = "Successfully got out"
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
