module SignInHelpers
  def user_logs_in(user)
    visit '/'
    click_on "Login"
    fill_in "Username", with: user.username
    fill_in "Password", with: "password"
    click_button "Login"
  end
end
