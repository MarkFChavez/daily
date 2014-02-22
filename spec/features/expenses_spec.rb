require 'spec_helper'

feature 'Expenses list' do
  scenario 'I should see the total expenses for the current month' do
    user = create(:user)
    two_days_from_now = 2.days.from_now
    four_days_from_now = 4.days.from_now

    expense = build(:expense, :amount => 500.00, :user => user)
    expense.created_at = two_days_from_now
    expense.save!
    expense = build(:expense, :amount => 500.00, :user => user)
    expense.created_at = two_days_from_now
    expense.save!
    expense = build(:expense, :amount => 200.00, :user => user)
    expense.created_at = four_days_from_now
    expense.save!
    sign_in(user.email, user.password)
  
    within("#expenses") do
      expect(page).to have_content "Total expenses: P1,000.00"
      expect(page).to have_content "Total expenses: P200.00"
    end
  end

  scenario 'I should see my total expenses for the current month' do

  end
end
