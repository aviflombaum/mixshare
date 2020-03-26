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
end