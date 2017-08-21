module Api
  class GoalsController < ApplicationController
    before_action :set_user

    def achieved
      @achieved_goals = @user.goals.where(completed: true, archived: true)
      if @achieved_goals
        render json: {
          goals: @achieved_goals
          }.to_json
      else
        @error = "Error: no achieved goals"
        render @error.to_json
      end
    end

    def current
      @current_goal = @user.goals.find_by(completed: false, archived: false)
      if @current_goal
        render @current_goal.to_json
      else
        @error = "Error: no current goal"
        render @error.to_json
      end
    end

    def create
      @new_goal = @user.goals.new(goal_params)
      @category = Category.find(params[:category_id])
      @category.goals << @new_goal
    end

    def update
      @current_goal = @user.goals.find_by(completed: false, archived: false)
      @current_goal.update(goal_params)
    end

    private
    def set_user
      @user = User.find_by(access_token: params[:access_token])
    end

    def goal_params
      params.require(:goal).permit(:title, :category_id, :user_id)
    end
  end
end
