class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    if !session[:user_id]
      erb :'users/create_user', locals: {message: "Please sign up before you sign in"}
    else
      redirect to '/home'
    end
  end

  post '/signup' do
    if params[:full_name] == "" || params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to 'signup'
    else
      @user = User.new(full_name: params[:full_name], username: params[:username], email: params[:email], password: params[:password])
    end
  end



end
