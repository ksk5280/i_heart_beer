require 'rails_helper'

RSpec.feature "User can create an account" do
  scenario "they see their dashboard" do
    visit '/'
    click_on "Register"
    fill_in "Username", with: "Kimiko"
    fill_in "Password", with: "password"
    click_on "Register"

    user = User.last

    expect(user_path(user)).to eq(current_path)
    expect(page).to have_content "Kimiko"
    within ".flash-success" do
      expect(page).to have_content "Thank you for registering for I Heart Beer!"
    end
  end

  context "with invalid username" do
    scenario "they see an error message" do
      visit '/'
      click_on "Register"
      fill_in "Password", with: "password"
      click_on "Register"

      within ".flash-error" do
        expect(page).to have_content "Username can't be blank"
      end
    end
  end
end
