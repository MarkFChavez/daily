require 'spec_helper'

describe Expense do
  context "#validations" do
    it 'should not accept an amount lesser than or equal to zero' do
      expense = build(:expense, :amount => 0)
      expect(expense).to_not be_valid

      expense = build(:expense, :amount => -1)
      expect(expense).to_not be_valid
    end

    it 'should require description' do
      expense = build(:expense, :description => "")
      expect(expense).to_not be_valid
    end
  end
end
