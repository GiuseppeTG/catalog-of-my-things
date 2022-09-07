require 'json'
require_relative './item'
require_relative './label'

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
      'cover_state' => @cover_state,
      'publisher' => @publisher,
      'label_id' => @label ? @label.id : nil,
      'author_id' => @author,
      'genre_id' => @genre,
      'source_id' => @source
    }.to_json(*args)
  end

  def self.json_create(book)
    new(book['id'], book['title'], book['publish_date'], book['archived'], book['cover_state'], book['publisher'],
        book['author'], book['label'], book['genre'], book['source'])
  end
end

# b1 = Book.new('1984', '2000-08-23', 'publisher1', 'bad')
# label = Label.new('NEW', 'yellow')
# b1.add_label(label)
# json = b1.to_json
# p json
# p b1.can_be_archived?
# b1.move_to_archive
# p b1
