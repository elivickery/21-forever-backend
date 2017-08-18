class CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories.to_json
  end
end
