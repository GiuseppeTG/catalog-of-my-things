require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(*args, multiplayer, last_played_at)
    super(*args)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?()
    value = false
    value = true if super(can_be_archived?) && last_played_at > 1
    value
  end
end

# Add title parameter to the game
