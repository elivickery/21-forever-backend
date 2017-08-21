module Api
  class DaysController < ApplicationController
    before_action :set_user

    def count
      @current_day = @user.days.find_by(status: nil)
      @current_goal = @current_day.goal
      @days = @current_goal.days
      count = @days.length
      render json: count.to_json
    end

    def update
      @current_day = @user.days.find_by(status: nil)
      @current_day.update(day_params)
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
