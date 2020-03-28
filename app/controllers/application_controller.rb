class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions
    set :session_secret, "mixshareapp-1234"
    
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end

end
