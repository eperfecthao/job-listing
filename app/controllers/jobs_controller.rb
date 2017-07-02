class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = Job.publish_status!.recent
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "你没有权限"
      redirect_to root_path
    end
  end
end
