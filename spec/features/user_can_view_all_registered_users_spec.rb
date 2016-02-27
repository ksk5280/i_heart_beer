require 'rails_helper'

RSpec.feature "User can view all registered users" do
  include SignInHelpers
  
  scenario "They see a list of all users" do
    user1 = User.create(username: "kimiko", password: "password")
    user2 = User.create(username: "julian", password: "password")
    user3 = User.create(username: "hoyoul", password: "password")

    user_logs_in(user1)

    click_link "All Users"

    expect(users_path).to eq(current_path)
    expect(page).to have_content "kimiko"
    expect(page).to have_content "julian"
    expect(page).to have_content "hoyoul"
  end
end
