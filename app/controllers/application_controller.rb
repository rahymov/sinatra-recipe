require './config/environment'


class ApplicationController < Sinatra::Base
# require 'sinatra/flash'
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

get '/' do
  @user = User.find_by(params[:user_id])
  erb :home
end

 helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
    # def partial(template, opts={})
    #     parts = template.split('/')
    # last = "_#{parts.pop}"
    #
    # erb([parts, last].flatten.join('/').to_sym, {layout: false}.merge(opts))
    #
    # end
  end


end
