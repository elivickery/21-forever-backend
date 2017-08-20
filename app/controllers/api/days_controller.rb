module Api
  class DaysController < ApplicationController
    def count
      @current_day = Day.find_by(status: nil)
      @current_goal = @current_day.goal
      @days = @current_goal.days
      count = @days.length
      render json: count.to_json
    end

    def update
      @current_day = Day.find_by(status: nil)
      @current_day.update(day_params)
    end

    private
    def day_params
      params.require(:day).permit(:status, :goal_id)
    end
  end
end
