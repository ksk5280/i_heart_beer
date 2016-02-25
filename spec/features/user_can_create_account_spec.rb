require 'rails_helper'

RSpec.feature "User can create an account" do
  scenario "they see their dashboard" do
    visit '/'
    click_on "Register"
    fill_in "Username", with: "Kimiko"
    fill_in "Password", with: "password"
    click_on "Register"

    user = User.last
    
    assert user_path(user), current_path
    assert page.has_content? "Kimiko"
    within ".flash-success" do
      assert page.has_content? "Thank you for registering for I Heart Beer!"
    end
  end
end
