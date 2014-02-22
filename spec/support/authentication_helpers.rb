module AuthenticationHelpers
  def sign_in(email, password)
    visit root_path
    click_on "Login"

    fill_in "Email", :with => email
    fill_in "Password", :with => password
    click_on "Sign in"
  end

  def user_should_be_signed_in
    expect(page).to have_css "a.logout", :text => "Logout"
    expect(page).to_not have_content "Sign in"
  end

  def user_should_be_signed_out
    expect(page).to have_content "Sign in"
    expect(page).to_not have_css "a.logout", :text => "Logout"
  end

  def user_should_be_on_dashboard
    expect(current_path).to eq dashboard_path
  end

  def user_should_have_greeting
    expect(page).to have_css ".greeting"
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelpers
end
