class Source
  attr_reader :items, :name, :id

  def initialize(name, id = nil)
    @id = id || Random.rand(1..1_000_000)
    @items = []
    @name = name
  end

  def add_item(item)
    @items << item
    item.add_source(self)
  end
end
