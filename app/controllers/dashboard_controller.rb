class DashboardController < ApplicationController

  def index
    @jobs = Job.all
    @group_by_interest = Job.group_by_interest
    @top_three = Company.top_three
  end
end
