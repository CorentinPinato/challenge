module V1
  class CategorySerializer
    include JSONAPI::Serializer
  
    set_type :category
    set_id :id

    attributes :name, :thumb_url, :description
  end
end