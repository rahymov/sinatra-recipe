class RecipesController < ApplicationController

  get '/recipes' do
    @user = User.find_by(params[:id])
    if logged_in?
      erb :'recipes/index'
    else
      redirect to '/login'
    end
  end

  get '/recipes/new' do
    @user = User.find_by(params[:id])
    if session[:user_id]
      erb :'recipes/new'
    else
      redirect to '/recipes'
    end
  end

  post '/recipes' do
    if params[:title].nil?
      redirect to 'recipes/new'
    else
      user = User.find_by_id(session[:user_id])
      @recipe = Recipe.create(title: params[:title],
                              description: params[:description],
                              ingredient: params[:ingredient],
                              directions: params[:ingredient],
                              image: params[:image],
                              user_id: user.id)
      redirect to "/recipes/#{@recipe.id}"
    end
  end

  get '/recipes/:id/edit' do
    erb :'recipes/edit'
  end


end
