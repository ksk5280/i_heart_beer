require 'rails_helper'

RSpec.feature "User can log out" do
  include SignInHelpers

  scenario "They see login page" do
    user = User.create(username: "kimiko", password: "password")

    user_logs_in(user)

    expect(user_path(user)).to eq(current_path)
    expect(page).to have_content "kimiko"
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
