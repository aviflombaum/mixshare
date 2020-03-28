class UsersController < ApplicationController

  get '/register' do
    erb :'users/new.html'
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]

    if @user.save
      redirect "/"
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
      session["user_id"] = @user.id.to_s
      redirect "/"
    else
      erb :'users/login.html'
    end
  end
end

