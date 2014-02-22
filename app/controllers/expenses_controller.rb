class ExpensesController < ApplicationController
  before_action :authenticate_user!

  def new
    @expense = Expense.new
  end

  def create
    @expense = current_user.expenses.build(expense_params)
    
    if @expense.save
      redirect_to dashboard_path, :notice => I18n.t('expense.create.success')  
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:amount, :description)
  end
end
