require 'json'
require_relative './item'

class Book < Item
  attr_accessor :title, :publisher, :cover_state

  def initialize(*args, publisher, cover_state)
    super(*args)
    @cover_state = cover_state
    @publisher = publisher
  end

  def can_be_archived?
    super || (@cover_state == 'bad')
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'title' => @title,
      'author' => @author,
      'cover_state' => @cover_state,
      'publisher' => @publisher
    }.to_json(*args)
  end

  def self.json_create(book)
    new(book['id'], book['publish_date'], book['archived'], book['author'], book['cover_state'], book['publisher'])
  end
end
