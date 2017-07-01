class Admin::JobsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :require_is_admin

  def index
    @jobs = Job.all.recent
  end

  def show

  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path, notice: "添加工作成功!"
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "修改工作成功!"
    else
      render :edit
    end
  end

  def destroy
    @job.destroy
    redirect_to admin_jobs_path, alert: "删除工作成功"
  end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound,
     :wage_lower_bound, :contact_email, :is_hidden)
  end
end
