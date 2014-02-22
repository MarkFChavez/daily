class DashboardsController < ApplicationController
  def show
    @expenses_per_day = current_user.expenses.group_by { |e| e.created_at.beginning_of_day }
  end
end
