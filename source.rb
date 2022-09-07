require_relative './item'

class Source
  attr_reader :items, :title, :publish_date
  def initialize(name, id = nil)
    @id = id || Random.rand(1..1_000_000)
    @items = []
    @name = name
  end

  def add_item(item)
    @items << item
  end
end
