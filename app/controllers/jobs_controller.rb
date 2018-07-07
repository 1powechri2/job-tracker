class JobsController < ApplicationController
  before_action :set_job, only: [:show, :destroy, :edit, :update]
  def index
    @company = Company.find(params[:company_id])
    @jobs = @company.jobs
  end

  def new
    @company = Company.find(params[:company_id])
    @job = Job.new()
  end

  def show
  end

  def create
    @company = Company.find(params[:company_id])
    @job = @company.jobs.new(job_params)
    if @job.save
      flash[:success] = "You created #{@job.title} at #{@company.name}"
      redirect_to company_job_path(@company, @job)
    else
      render :new
    end
  end

  def destroy
    # implement on your own!
  end

  def edit
    @company = @job.company
  end

  def update
    @job.update(job_params)
    redirect_to company_job_path(@job.company, @job)
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :level_of_interest, :city)
  end
end
