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
      fill_in "Password", with: "password"
      click_button "Login"

      click_on "Edit"
      fill_in "Username", with: "kimiko"
      fill_in "Password", with: ""
      click_button "Submit Changes"

      expect(page).to have_content "Failed to update account"
    end
  end
end
