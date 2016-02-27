require 'rails_helper'

RSpec.feature "User cannot edit another users account" do
  include SignInHelpers

  scenario "they do not see edit button" do
    user1 = User.create(username: "kimiko", password: "password")
    user2 = User.create(username: "julian", password: "password")
    user3 = User.create(username: "hoyoul", password: "password")

    user_logs_in(user1)

    # when I visit the users page
    visit users_path
    # When I click on a user
    click_on "hoyoul"
    # I expect to see their show page
    expect(page).to have_content "hoyoul"
    # I expect to not be able to edit their account info
    expect(page).to_not have_content "Edit"
  end
end
