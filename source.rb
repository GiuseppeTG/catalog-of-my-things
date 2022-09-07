require_relative './item'

class Source < item
  def initialize(title, publish_date, name id = nil)
    super(title, publish_date, id)

    @id = id || Random.rand(1..1_000_000)
    @items = []
  end
end
