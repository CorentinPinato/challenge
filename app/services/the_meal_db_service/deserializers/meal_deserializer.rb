module TheMealDbService
  module Deserializers
    module MealDeserializer
      extend Deserializers::Base

      def self.call(object, collection: true)
        raise Errors::NotFoundError.new("Meal not found.") if collection && object.meals.nil?

        if object.meals.present?
          object.meals.map { |x| call(x, collection: false) }
        else
          ::Meal.new(
            id: object.idMeal,
            name: object.strMeal,
            drink_alternate: object.strDrinkAlternate,
            category: object.strCategory,
            area: object.strArea,
            instructions: object.strInstructions,
            thumb_url: object.strMealThumb,
            tags: tags(object),
            youtube_url: object.strYoutube,
            ingredients: ingredients(object),
            source: object.strSource,
            image_source: object.strImageSource,
            creative_commons_confirmed: object.strCreativeCommonsConfirmed,
            date_modified: object.dateModified
          )
        end
      end

      private

      def self.ingredients(object)
        (1..20).map do |i|
          {
            name: object.send("strIngredient#{i}"),
            measure: object.send("strMeasure#{i}")
          }
        end.reject { |ingredient| ingredient[:name].blank? }
      end

      def self.tags(object)
        object.strTags&.split(",") || []
      end
    end
  end
end