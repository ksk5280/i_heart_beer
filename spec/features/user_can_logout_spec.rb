require 'rails_helper'

RSpec.feature "User can log out" do
  scenario "They see login page" do
    user = User.create(username: "Kimiko", password: "password")

    visit '/'
    click_on "Login"
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    expect(user_path(user)).to eq(current_path)
    expect(page).to have_content "Kimiko"
    expect(page).to have_content "Logout"
    expect(page).to_not have_content "Login"

    click_on "Logout"

    within ".flash-notice" do
      expect(page).to have_content "You've logged out!"
    end
    expect(page).to_not have_content "Logout"
    expect(page).to have_content "Login"
  end
end
