module TheMealDbService
  module Deserializers
    module CategoryDeserializer
      extend Deserializers::Base

      def self.call(object)
        if object.categories.present?
          object.categories.map { |x| call(x) }
        else
          ::Category.new(
            id: object.idCategory,
            name: object.strCategory,
            thumb_url: object.strCategoryThumb,
            description: object.strCategoryDescription
          )
        end
      end
    end
  end
end