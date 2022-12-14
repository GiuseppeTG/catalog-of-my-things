require_relative './game'

class MenuGame
  def game_options
    puts 'Adding a new game...'
    puts 'Enter the title of the game?'
    input_title = gets.chomp

    puts 'Enter the publish date of the game(yyyy-mm-dd)'
    input_publish_date = gets.chomp

    puts 'Is this a multiplayer game? [Y/N]'
    answer = gets.chomp.upcase
    %w[N NO].include?(answer)

    until %w[Y YES N NO].include?(answer)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp.upcase
    end
    %w[Y YES].include?(answer)
    input_multiplayer = true

    puts 'How much time ago it was last used? (no of years?)'
    input_last_used = gets.chomp.to_i

    game = Game.new(input_title, input_publish_date, input_last_used, input_multiplayer)

    if game.can_be_archived?
      puts 'Do you want to archive the game? [Y/N]'
      answer = gets.chomp.upcase
      return if %w[N NO].include?(answer)

      until %w[Y YES N NO].include?(answer)
        print 'Wrong option, please enter [Y/N] '
        answer = gets.chomp.upcase
      end
      %w[Y YES].include?(answer)
      game.move_to_archive
    end
    game
  end
end
