require_relative './item'

class Movie < Item
  def initialize(title, publish_date, id = nil, silent: false)
    super(title, publish_date, id)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end
