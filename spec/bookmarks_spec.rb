# frozen_string_literal: true

require 'bookmarks'

describe Bookmarks do
  describe '.all' do

    it 'prints a list of bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.pomodoro.com', 'Pomodoro');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.tomato-timer.com', 'Tomato-Timer');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES('http://www.google.com', 'Google');")

      bookmarks = Bookmarks.all

      expect(bookmarks).to include('Google')
      expect(bookmarks).to include('Pomodoro')
      expect(bookmarks).to include('Tomato-Timer')
    end
  end

  describe '.create' do
    it 'creates new bookmark' do
      Bookmarks.create(url: 'http://facebook.com', title: 'Facebook')

      expect(Bookmarks.all).to include 'Facebook'
    end
  end

end
