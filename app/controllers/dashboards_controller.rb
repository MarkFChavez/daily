class DashboardsController < ApplicationController
  def show
    @expenses = current_user.expenses
    @expenses_per_day = @expenses.group_by { |e| e.created_at.beginning_of_day }
  end
end
