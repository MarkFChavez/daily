require 'spec_helper'

feature 'Expenses list' do
  scenario 'should display total expenses' do
    user = create(:user)
    expense = create(:expense, :user => user, :amount => 100.00)
    expense = create(:expense, :user => user, :amount => 200.00)
    sign_in(user.email, user.password)

    expect(page).to have_css ".total", :text => "Total expenses: P300.00"
  end
end
