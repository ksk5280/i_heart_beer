require 'rails_helper'

RSpec.feature "User can view all registered users" do
  scenario "They see a list of all users" do
    user1 = User.create(username: "kimiko", password: "password")
    user2 = User.create(username: "julian", password: "password")
    user3 = User.create(username: "hoyoul", password: "password")

    visit '/'
    click_on "Login"
    fill_in "Username", with: user1.username
    fill_in "Password", with: "password"
    click_button "Login"

    click_link "All Users"

    expect(users_path).to eq(current_path)
    expect(page).to have_content "kimiko"
    expect(page).to have_content "julian"
    expect(page).to have_content "hoyoul"
  end
end
