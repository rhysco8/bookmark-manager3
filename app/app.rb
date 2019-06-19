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
    url = params[:new_bookmark]
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end

  
  run! if app_file == $PROGRAM_NAME
end
