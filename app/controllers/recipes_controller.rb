
class RecipesController < ApplicationController

  get '/search' do
  @recipes = Recipe.all
   if current_user
      if params[:search]
        @recipes = Recipe.search(params[:search])
      else
        @recipes = Recipe.all
      end
   else
    redirect to '/login'
   end
      # erb :'recipes/results'
  end

  post '/search' do
    erb :'recipes/results'
  end

  get '/recipes' do
    user = User.find_by(params[:id])
    @recipe = Recipe.find_by_id(params[:id])
    # @recipes = Recipe.all(:name.like => "#{params[:name]}")
    @category = Category.find_by(params[:id])
    @category_recipes = @category.recipes
    # @recipe.user = @user
    @categories = Category.all
    if logged_in?
      @recipes = Recipe.all.order("created_at DESC")
      erb :'recipes/index'
    else
      redirect to '/login'
      flash[:message] = "You have to login"
    end
  end

  get '/recipes/new' do
    @user = User.find_by(params[:id])
    @categories = Category.all
    if session[:user_id]
      erb :'recipes/new'
    else
      flash[:message] = "You have to login"
      redirect to '/recipes'
    end
  end

  post '/recipes' do
    if params[:title].blank? && params[:description].blank? && params[:ingredient].blank? && params[:directions].blank?
      redirect to 'recipes/new'

    else
      user = User.find_by_id(session[:user_id])
      # @categories = Category.find_by(params[:category_ids])
      @recipe = Recipe.new(title: params[:title],
                              description: params[:description],
                              ingredient: params[:ingredient],
                              directions: params[:ingredient],

                              image: params[:image],
                              :user_id => user.id)
      @recipe.category_ids = params[:categories]

      @filename = params[:file][:filename]
      file = params[:file][:tempfile]
      @recipe.image = @filename
      @recipe.save
      File.open("./public/#{@recipe.image}", 'wb') do |f|
        f.write(file.read)
      end
      flash[:message] = "Recipe created successfully."
      redirect to "/recipes/#{@recipe.id}"
    end
  end

  get '/recipes/:id' do
    @user = User.find_by(params[:id])
    if session[:user_id]
      @recipe = Recipe.find_by_id(params[:id])
      erb :'recipes/show'
    else
      redirect to '/recipes'
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
    else
      redirect to '/login'
    end
  end

  patch '/recipes/:id' do
    @user = User.find(params[:id])
    if params[:title].blank? && params[:description].blank? && params[:ingredient].blank? && params[:directions].blank?
      redirect to '/recipes/#{params[:id]}/edit'
    else
      @recipe = Recipe.find_by_id(params[:id])
      @recipe.title = params[:title]
      @recipe.description = params[:description]
      @recipe.ingredient = params[:ingredient]
      @recipe.directions = params[:directions]
      @recipe.image = params[:image]
      @recipe.save
      redirect to '/recipes'
      flash[:message] = "Recipe updated successfully."
    end
  end

  delete '/recipes/:id/delete' do
    # user = User.find(params[:id])
    current_user
    @recipe = Recipe.find_by_id(params[:id])
    if session[:user_id]
      @recipe = Recipe.find_by_id(params[:id])
      if @recipe.user_id == session[:user_id]
        @recipe.delete
        flash[:message] = "Recipe deleted successfully."
        redirect to '/recipes'
      else
        redirect to '/recipes'
      end
      redirect to '/login'
    end
  end

end
