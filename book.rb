require 'json'
require_relative './item'
require_relative './label'

class Book < Item
  attr_accessor :publisher, :cover_state

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
      'cover_state' => @cover_state,
      'publisher' => @publisher,
      'label' => @label ? ['id' => @label.id, 'title' => @label.title, 'color' => @label.color] : nil,
      'author' => @author ? ['id' => @author.id, 'first_name' => @author.first_name, 'last_name' => author.last_name] : nil,
      'genre' => @genre ? ['id' => @genre.id, 'name' => @genre.name] : nil,
      'source' => @source ? ['id' => @source.id, 'name' => @source.name] : nil
    }.to_json(*args)
  end

  def self.json_create(book)
    new(book['id'], book['title'], book['publish_date'], book['archived'], book['cover_state'], book['publisher'],
        book['author'], book['label'], book['genre'], book['source'])
  end
end
