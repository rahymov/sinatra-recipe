class RecipesController < ApplicationController

  get '/recipes' do
    @user = User.find_by(params[:id])
    if logged_in?
      @recipes = Recipe.all
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
    @user = User.find_by(params[:id])
    if session[:user_id]
      @recipe = Recipe.find_by(params[:id])
      if @recipe.user_id == session[:user_id]
        erb :'recipes/edit'
      else
        redirect to '/recipes'
      end
      redirect to '/login'
    end
  end

  patch '/recipes/:id' do
    args = [:title, :description, :ingredient, :directions, :image]
    if params[:args] == ""
      redirect to '/recipes/#{params[:id]}/edit'
    else
      @recipe = Recipe.find_by(params[:id])
      @recipe.title = params[:title]
      @recipe.description = params[:description]
      @recipe.ingredient = params[:ingredient]
      @recipe.directions = params[:directions]
      @recipe.image = params[:image]
      @recipe.save
      redirect to '/recipes/#{@recipe.id}'
    end
  end

  delete '/recipes/:id/delete' do
    @user = User.find(params[:id])
    @recipe = Recipe.find_by(params[:id])
    if session[:user_id]
      @recipe = Recipe.find_by_id(params[:id])
      if @recipe.user_id == session[:user_id]
        @recipe.delete
        redirect to '/recipes'
      else
        redirect to '/recipes'
      end
      redirect to '/login'
    end
  end

end
