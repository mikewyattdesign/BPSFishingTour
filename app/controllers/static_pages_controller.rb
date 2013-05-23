class StaticPagesController < ApplicationController
  def home
  end

  def thanks
    flash[:notice] = "notice message"
    flash[:alert] = "alert message"
    flash[:error] = "error message"
    flash[:success] = "success message"
  end

  def confirm
  end
end
