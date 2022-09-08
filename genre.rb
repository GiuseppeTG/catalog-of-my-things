class Genre
  attr_accessor :name
  attr_reader :id, :items

  def initialize(name, id = nil)
    @id = id || rand(1..1_000_000)
    @name = name
    @items = []
  end

  def add_item(item)
    # return unless item.instance_of?(Item) && !@items.include?(item)

    @items.push(item)
    item.add_genre(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'name' => @name,
      'items' => @items
    }.to_json(*args)
  end

  ### review below line (for better understand as it was '_book')
  def self.json_create(_genre)
    new(genre['id'], genre['name'], genre['items'])
  end
end
