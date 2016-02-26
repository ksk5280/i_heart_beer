require "rails_helper"

RSpec.feature "User can edit account" do
  scenario "They see new account info" do
    user = User.create(username: "kimiko", password: "password")

    visit '/'
    click_on "Login"
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"

    visit user_path(user)
    click_on "Edit"
    fill_in "Username", with: "kimi"
    fill_in "Password", with: "pa$$word"
    click_on "Submit Changes"

    within ".flash-success" do
      expect(page).to have_content "Account edited"
    end
    expect(page).to have_content "kimi"
  end

  context "with invalid username" do
    scenario "they see an error message" do
      user = User.create(username: "kimiko", password: "password")

      visit '/'
      click_on "Login"
      fill_in "Username", with: "kimiko"
      fill_in "Password", with: "fdhfdksj"
      click_button "Login"

      visit user_path(user)
      click_on "Edit"
      fill_in "Username", with: "kimi"
      fill_in "Password", with: ""

# an empty password doesn't cause the password to change at the moment
      expect(page).to have_content "Invalid Account Information"
      expect(page).to have_content "kimiko"
    end
  end
end
