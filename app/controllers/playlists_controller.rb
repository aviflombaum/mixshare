class PlaylistsController < ApplicationController
  before '/playlists/*' do
    authentication_required
  end

  get '/playlists' do 
    @playlists = current_user.playlists
    erb :"playlists/index.html"
  end

  get '/playlists/new' do
    erb :"playlists/new.html"
  end

  get '/playlists/:id' do
    @playlist = current_user.playlists.find(params[:id])

    erb :"playlists/show.html"
  end

  post '/playlists' do 
    @playlist = Playlist.new
    @playlist.name = params[:name]
    @playlist.user = current_user
    
    if @playlist.save
      redirect '/playlists'
    else
      erb :"playlists/new.html"
    end
  end


end