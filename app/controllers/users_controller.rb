class UsersController < ApplicationController

  get '/register' do
    erb :'users/new.html'
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      redirect "/login"
    else
      erb :'users/new.html'
    end
  end

  get '/login' do
    erb :'users/login.html'
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session["user_id"] = @user.id
      redirect "/"
    else
      erb :'users/login.html'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end
end

