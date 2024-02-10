class Category
  attr_accessor :id, :name, :thumb_url, :description

  def initialize(id:, name:, thumb_url:, description:)
    @id = id
    @name = name
    @thumb_url = thumb_url
    @description = description
  end
end