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
        render json: @error.to_json
      end
    end

    def current
      @current_goal = @user.goals.where(completed: false, archived: false)
      if @current_goal
        render json: @current_goal.to_json
      else
        @error = "Error: no current goal"
        render json: @error.to_json
      end
    end

    def create
      puts params
      @category_chosen = Category.find_by(title: params[:category])
      goal = Goal.create(
        user_id: @user.id,
        category_id: @category_chosen.id,
        title: params[:title],
        archived: false,
        completed: false
        )
      goal.days.create
      render true
    end

    def update
      @current_goal = @user.goals.find_by(completed: false, archived: false)
      @current_goal.update(goal_params)
      render json: {goal_updated: true}.to_json
    end

    private
    def set_user
      @user = User.find_by(access_token: params[:access_token])
    end

    def goal_params
      params.require(:goal).permit(:title, :category_id, :user_id, :archived, :completed)
    end
  end
end
