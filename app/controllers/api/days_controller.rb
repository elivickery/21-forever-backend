module Api
  class DaysController < ApplicationController
    before_action :set_user

    def count
      @current_goal = @user.goals.find_by(completed: false, archived: false)
      @days = @current_goal.days
      count = @days.length
      render json: count.to_json
    end

    def update
      @current_goal = @user.goals.find_by(completed: false, archived: false)
      @current_day = @current_goal.days.find_by(status: nil)
      @current_day.update(day_params)
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
