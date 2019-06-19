# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'Visit bookmarks page and be presented with a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.pomodoro.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.tomato-timer.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')

    expect(page).to have_content 'These are your bookmarks:'
    expect(page).to have_content 'www.pomodoro.com'
    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'www.tomato-timer.com'
  end
end
