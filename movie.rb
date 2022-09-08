require_relative './item'

class Movie < Item
  def initialize(title, publish_date, silent=false)
    super(title, publish_date, id = nil)
    @silent = silent
  end
end
