# frozen_string_literal: true

require 'sinatra/base'
require_relative '../lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  get '/add_bookmark' do
    erb :add_bookmark
  end

  post '/new_bookmark' do
    Bookmarks.create(url: params[:new_bookmark_url], title: params[:new_bookmark_title])
    redirect '/bookmarks'
  end


  run! if app_file == $PROGRAM_NAME
end
