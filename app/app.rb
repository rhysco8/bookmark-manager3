# frozen_string_literal: true

require 'sinatra/base'
require_relative '../lib/bookmarks.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    @bookmarks = Bookmarks.all
    erb(:bookmarks)
  end

  run! if app_file == $PROGRAM_NAME
end
