module TheMealDbService
  module Meal
    def self.fetch(id)
      response = Faraday.get("#{Base::URL}/lookup.php?i=#{id}")
      Deserializers::MealDeserializer.deserialize(response).first
    end

    def self.find_by_category(category)
      response = Faraday.get("#{Base::URL}/filter.php?c=#{category}")
      Deserializers::MealDeserializer.deserialize(response)
    end
  end
end