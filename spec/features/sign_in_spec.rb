require 'spec_helper'

feature 'User sign in' do
  context 'using valid credentials' do
    let!(:user) { create(:user, :email => "validuser@yahoo.com") }

    scenario 'signs me in and shows the logout link' do
      sign_in(user.email, user.password)

      user_should_be_signed_in
      user_should_be_on_dashboard
    end

    scenario 'signs me in and shows the email as a greeting' do
      sign_in(user.email, user.password)

      user_should_have_greeting
      user_should_be_signed_in
      user_should_be_on_dashboard
    end
  end

  context 'using invalid credentials' do
    let!(:user) { build(:user) }

    scenario 'does not sign me in, returns an error message' do
      sign_in(user.email, user.password)

      user_should_be_signed_out
    end
  end
end
