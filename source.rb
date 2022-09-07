require_relative './item'

class Source < item
  attr_reader :items
  def initialize(title, publish_date, name id = nil)
    super(title, publish_date, id)

    @id = id || Random.rand(1..1_000_000)
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
