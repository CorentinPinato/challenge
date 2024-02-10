class Meal
  attr_accessor *%i[
    id
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

  def initialize(**args)
    @id = args[:id]
    @name = args[:name]
    @drink_alternate = args[:drink_alternate]
    @category = args[:category]
    @area = args[:area]
    @instructions = args[:instructions]
    @thumb_url = args[:thumb_url]
    @tags = args[:tags]
    @youtube_url = args[:youtube_url]
    @ingredients = args[:ingredients]
  end

  def v1_url
    "#{ENV.fetch('BASE_URL')}/v1/meals/#{id}"
  end
end