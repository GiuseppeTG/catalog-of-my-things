require 'json'
require_relative './item'
require_relative './label'
require_relative './genre'

class MusicAlbum < Item
  attr_accessor :title, :publisher, :on_spotify

  def initialize(*args, publisher, on_spotify)
    super(*args)
    @on_spotify = on_spotify
    @publisher = publisher
  end

  def can_be_archived?
    super || (@on_spotify)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'title' => @title,
      'on_spotify' => @on_spotify,
      'publisher' => @publisher,
      'label_id' => @label.id,
      'author_id' => @author,
      'genre_id' => @genre,
      'source_id' => @source
    }.to_json(*args)
  end

  def self.json_create(music_album)
    new(music_album['id'], music_album['title'], music_album['publish_date'], music_album['archived'],
        music_album['on_spotify'], music_album['publisher'], music_album['author'], music_album['label'],
        music_album['genre'], music_album['source'])
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
