require 'json'
require_relative './item'
require_relative './label'
require_relative './genre'

class MusicAlbum < Item
  attr_accessor :title, :on_spotify

  def initialize(*args, on_spotify)
    super(*args)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'title' => @title,
      'on_spotify' => @on_spotify,
      'label' => @label ? ['id' => @label.id, 'title' => @label.title, 'color' => @label.color] : nil,
      'author' => @author ? ['id' => @author.id, 'first_name' => @author.first_name, 'last_name' => author.last_name] : nil,
      'genre' => @genre ? ['id' => @genre.id, 'name' => @genre.name] : nil,
      'source' => @source ? ['id' => @source.id, 'name' => @source.name] : nil
    }.to_json(*args)
  end

  def self.json_create(music_album)
    new(music_album['id'], music_album['publish_date'], music_album['archived'], music_album['title'],
        music_album['on_spotify'], music_album['label'], music_album['author'], music_album['genre'], music_album['source'])
  end
end
