require './app'
require './game'

module GameOption
  include App

  def add_game(games_list)
    puts 'In order to create a new game we need some information first...'
    puts 'What is the is this game multiplayer?'
    game_multiplayer = gets.chomp
    puts 'Who is the Author?'
    game_last_played = gets.chomp
    add_game_list(games_list, game.new(game_multiplayer, game_last_played))
  end
end