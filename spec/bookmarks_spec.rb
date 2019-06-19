# frozen_string_literal: true

require 'bookmarks'

describe Bookmarks do
  describe '.all' do

    it 'prints a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.pomodoro.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.tomato-timer.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmarks.all

      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.pomodoro.com')
      expect(bookmarks).to include('http://www.tomato-timer.com')
    end
  end

  describe '.create' do
    it 'creates new bookmark' do
      Bookmarks.create(url: 'http://facebook.com')

      expect(Bookmarks.all).to include 'http://facebook.com'
    end
  end

end
