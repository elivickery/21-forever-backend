class GoalsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @goals = @category.goals
    render json: @goals.to_json
  end

  def show
    @goal = Goal.find(params[:id])
    render json: @goal.to_json
  end

  def create
    # Come back when devise is figured out. Include errors.
    @user = User.find(params[:user_id])
    @new_goal = @user.goals.new(goal_params)
    @category = Category.find(params[:category_id])
    @category.goals << @new_goal
  end

  def update
    # Include errors.
    @goal = Goal.find(params[:id])
    @goal.update(goal_params)
  end

  private
  def goal_params
    params.require(:goal).permit(:title)
  end
end
