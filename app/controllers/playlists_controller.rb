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

  # SongsController Begins
  get '/playlists/:playlist_id/songs/:id' do
    @playlist = current_user.playlists.find(params[:playlist_id])
    @song = @playlist.songs.find(params[:id])

    erb :"songs/show.html"
  end

  post '/playlists/:id/songs' do
    @playlist = current_user.playlists.find(params[:id])
    @song = @playlist.songs.build(:url => params[:url])
    if @song.save
      redirect "/playlists/#{@playlist.id}"
    else
      erb :"playlists/show.html"
    end
  end

  post '/playlists/:id/publish' do
    @playlist = current_user.playlists.find(params[:id])
    if @playlist.publish!
      "Deployed to #{@playlist.rmx_url}"
    else
      "Failure"
    end
  end
end