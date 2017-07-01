class WelcomeController < ApplicationController
  def index
    flash[:notice] = "测试flash!"
  end
end
