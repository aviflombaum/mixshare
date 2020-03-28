class PlaylistsController < ApplicationController
  before '/playlists/*' do
    authentication_required
  end

  get '/playlists/new' do
    erb :"playlists/new.html"
  end

  get '/playlists/1' do
    "Hello"
  end


end