class UsersController < ApplicationController
  # use Rack::Session::Pool, :expire_after => 1800
  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    if !logged_in?
      erb :'users/create_user'
    else
      redirect to '/'
    end
  end

  post '/signup' do
    if params[:full_name] == "" || params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
      flash[:message] = "Can't be blank."
    else
      @user = User.new(full_name: params[:full_name], username: params[:username], email: params[:email], password: params[:password])
      if @user.valid?
        @user.save
        session[:user_id] = @user.id
        flash[:message] = "Successfully signed up."
        redirect to '/'
      else
        flash[:message] = "Username should be unique."
        redirect to '/signup'
      end
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/home'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:message] = "Logged in successfully."
      redirect "/"
    else
      redirect to '/login'
    end
  end

  get '/logout' do
    if session[:user_id] != nil
      session.destroy
      flash[:message] = "Successfully logged out."
      redirect to '/login'
    else
      redirect to '/'
    end
  end

end
