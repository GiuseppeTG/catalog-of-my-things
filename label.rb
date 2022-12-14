class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color, id = nil)
    @id = id || rand(1..1_000_000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items.push(item)
    item.add_label(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'color' => @color
    }.to_json(*args)
  end

  def self.json_create(_book)
    new(label['id'], label['title'], label['color'], label['items'])
  end
end
