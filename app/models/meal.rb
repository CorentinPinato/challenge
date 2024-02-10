class Meal
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
end