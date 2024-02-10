module TheMealDbService
  module Deserializers
    module Base
      def deserialize(response)
        object = JSON.parse(response.body, object_class: OpenStruct)
        call(object)
      end
    end
  end
end