require 'json'
require_relative './item'
require_relative './label'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(*args, last_played_at, multiplayer)
    super(*args)
    @last_played_at = last_played_at
    @multiplayer = multiplayer

  end

  # Convert game to json format

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'title' => @title,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'multiplayer' => @multiplayer,
      'last_played_at' => @last_played_at,
      'author' => @author ? ['id' => @author.id, 'first_name' => @author.first_name, 'last_name' => author.last_name] : nil,
      'label' => @label ? ['id' => @label.id, 'title' => @label.title, 'color' => @label.color] : nil,
      'genre' => @genre ? ['id' => @genre.id, 'name' => @genre.name] : nil,
      'source' => @source ? ['id' => @source.id, 'name' => @source.name] : nil,

    }.to_json(*args)
  end

  def self.json_create(game)
    new(game['id'], game['title'], game['publish_date'], game['archived'],
        game['multiplayer'], game['last_played_at'],
        game['author'], game['label'], game['genre'], game['source'])
  end

  def can_be_archived?()
    super && last_played_at > 1
  end
end

game = Game.new('title', '2000-12-24', 1, true)
p game
