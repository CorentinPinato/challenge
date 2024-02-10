module V1
  class CategoriesController < ApplicationController
    def index
      categories = TheMealDbService::Category.fetchAll
      render json: CategorySerializer.new(categories), status: :ok
    end
  end
end