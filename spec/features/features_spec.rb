# frozen_string_literal: true

feature 'Viewing bookmarks' do
  scenario 'Visit bookmarks page and be presented with a list of bookmarks' do

    Bookmarks.create(url: 'http://www.pomodoro.com', title: 'Pomodoro')
    Bookmarks.create(url: 'http://www.tomato-timer.com', title: 'Tomato-Timer')
    Bookmarks.create(url: 'http://www.google.com', title: 'Google')

    visit('/bookmarks')

    expect(page).to have_content 'These are your bookmarks:'
    expect(page).to have_content 'Pomodoro'
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Tomato-Timer'
  end

  scenario 'add new bookmark' do
    visit('/bookmarks')
    click_button("Add new bookmark")
    fill_in 'new_bookmark_url', with: 'www.facebook.com'
    fill_in 'new_bookmark_title', with: 'Facebook'
    click_button('Add bookmark')

    expect(page).to have_content 'Facebook'

  end

end
