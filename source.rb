require 'json'

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

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name
    }.to_json(*args)
  end

  def self.json_create(_source)
    new(source['id'], source['title'], source['color'], source['items'])
  end
end
