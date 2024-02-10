module V1
  class MealsController < ApplicationController
    def index
      meals = TheMealDbService::Meal.find_by_category(permitted_params[:category])
      fields = { fields: { meal: [:name, :thumb_url] } }
      render json: MealSerializer.new(meals, fields).serializable_hash.to_json, status: :ok
    end

    def show
      meal = TheMealDbService::Meal.fetch(permitted_params[:id])
      render json: MealSerializer.new(meal).serializable_hash.to_json, status: :ok
    end

    private 

    def permitted_params
      params.permit(:id, :category)
    end
  end
end