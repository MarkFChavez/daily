class DashboardsController < ApplicationController
  def show
    @expenses = current_user.expenses
  end
end
