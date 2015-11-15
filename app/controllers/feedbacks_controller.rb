class FeedbacksController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :create]
  def new
    @feedback= Feedback.new
  end

  def create
    safe_feedback = params.require(:feedback).permit(:helpful, :accurate, :interested, :comments)
    @feedback = current_user.feedbacks.new safe_feedback

    @feedback.save
    redirect_to @feedback
  end

  def show
    @feedback= Feedback.find params[:id]
  end

  def index
    @classifieds = Feedback.last(30)
  end
end