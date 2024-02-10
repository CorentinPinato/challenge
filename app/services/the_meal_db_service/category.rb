module TheMealDbService
  module Category
    def self.fetchAll
      response = Faraday.get("#{Base::URL}/categories.php")
      Deserializers::CategoryDeserializer.deserialize(response)
    end
  end
end