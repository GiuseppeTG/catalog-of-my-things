require_relative './item.rb'

class Game < Item

    attr_accessor :multiplayer, :last_played_at

    def initialize(multiplayer,last_played_at)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    private

    def can_be_archived?()
        value = false
        if super(can_be_archived?) && last_played_at
            value =true
        end
        value
    end

end