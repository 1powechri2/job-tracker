class DashboardController < ApplicationController

  def index
    @jobs = Job.all
    @group_by_interest = Job.group_by_interest
  end
end
