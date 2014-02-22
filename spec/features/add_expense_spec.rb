require 'spec_helper'

feature 'Adding expenses' do
  context 'as an authenticated user' do
    scenario 'with valid supplied data' do
      user = create(:user)
      sign_in(user.email, user.password)

      click_on "Add expense"
      fill_in "Amount", :with => 200.00
      fill_in "Description", :with => "spent it on something important"
      click_on "Add Expense"

      expect(page).to have_css ".flash_notice", :text => I18n.t('expense.create.success')
      within("#expenses") do
        expect(page).to have_css ".expense", :text => "spent it on something important"
        expect(page).to have_css ".expense", :text => "P200.00"
      end
    end

    scenario 'with invalid supplied amount' do
      user = create(:user)
      sign_in(user.email, user.password)

      click_on "Add expense"
      fill_in "Amount", :with => 0
      fill_in "Description", :with => "spent it on something important"
      click_on "Add Expense"

      expect(page).to have_content "must be greater than 0"
      expect(current_path).to eq expenses_path
    end

    scenario 'with invalid description' do
      user = create(:user)
      sign_in(user.email, user.password)

      click_on "Add expense"
      fill_in "Amount", :with => 200.00
      fill_in "Description", :with => ""
      click_on "Add Expense"

      expect(page).to have_content "can't be blank"
      expect(current_path).to eq expenses_path
    end
  end
  

  scenario 'as an unauthenticated user' do
    visit new_expense_path
    
    expect(page).to have_css ".flash_alert", :text => I18n.t('devise.failure.unauthenticated')
    expect(current_path).to eq new_user_session_path
  end
end
