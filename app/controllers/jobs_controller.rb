class JobsController < ApplicationController
  before_action :authenticate_user!

  def index
    @jobs = Job.publish!
  end

  def show
    @job = Job.find(params[:id])
  end
end
