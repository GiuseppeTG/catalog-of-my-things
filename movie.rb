require_relative './item'

class Movie < Item
  def initialize(title, publish_date, silent=false)
    super(title, publish_date, id = nil)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end
