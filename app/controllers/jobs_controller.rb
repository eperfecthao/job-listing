class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = case params[:order]
      when "by_lower_bound"
        Job.publish_status!.order("wage_lower_bound DESC")
      when "by_upper_bound"
        Job.publish_status!.order("wage_upper_bound DESC")
      else
        Job.publish_status!.recent
      end
  end

  def show
    @job = Job.find(params[:id])

    if @job.is_hidden
      flash[:warning] = "你没有权限"
      redirect_to root_path
    end
  end
end
