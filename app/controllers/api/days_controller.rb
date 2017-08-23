module Api
  class DaysController < ApplicationController
    before_action :set_user

    def current
      @current_goal = @user.goals.where(completed: false, archived: false).last
      @current_day = @current_goal.days.order('id').last
      render json: {complete: status}.to_json
    end

    def count
      @current_goal = @user.goals.find_by(completed: false, archived: false)
      @days = @current_goal.days
      count = @days.length
      render json: count.to_json
    end

    def update
      # was returning more than one goal in line 14. Add .last.
      @current_goal = @user.goals.where(completed: false, archived: false).last
      @current_day = @current_goal.days.order('id').last
      @current_day.update(status: params[:status])
      status = (@current_goal.days.length === 21)
      @current_goal.update(completed: true, archived: true) if status
      render json: {complete: status}.to_json
    end

    private
    def set_user
      @user = User.find_by(access_token: params[:access_token])
    end

    def day_params
      params.require(:day).permit(:status)
    end
  end
end
