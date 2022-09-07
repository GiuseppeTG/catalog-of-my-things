require 'json'
require_relative './item'
require_relative './label'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(*args, multiplayer, last_played_at)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
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
      'last_played_at' => @last_played_at

    }.to_json(*args)
  end

  def self.json_create(game)
    new(game['id'], game['title'], game['publish_date'], game['archived'],
        game['multiplayer'], game['last_played_at'])
  end

  private

  def can_be_archived?()
    value = false
    value = true if super(can_be_archived?) && last_played_at > 1
    value
  end
end

# Add title parameter to the game
