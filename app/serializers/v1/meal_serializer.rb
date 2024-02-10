module V1
  class MealSerializer
    include JSONAPI::Serializer
  
    set_type :meal
    set_id :id

    attributes *%i[
      name
      drink_alternate
      category
      area
      instructions
      thumb_url
      tags
      youtube_url
      ingredients
    ]

    link :self, :v1_url
  end
end