require 'rails_helper'

RSpec.feature "User can login" do

  scenario "they see their dashboard" do
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
  end

  context "with invalid password" do
    scenario "they see an error message" do
      # as a user
      # when I visit the home page
      # and click Login
      # and fill in username
      # and fill in invalid password
      # and click login
      # expect to see error message
      # expect(page).to_not have_content "Kimiko"
    end
  end
end
