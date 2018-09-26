class UsersController < Sinatra::Base

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/create_user', locals: {message: "Please signup to see recipes."}
    else
      redirect to '/'
    end
  end

  post 'signup' do
    if params[:full_name] == "" || params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to 'signup'
    else
      @user = User.new(full_name: params[:full_name], username: params[:username], email: params[:email], password: params[:password])
    end
  end

end
