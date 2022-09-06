module App
    def list_of_games(games_list)
      puts 'List of Games:'
      if games_list.empty?
        puts '---------------------------------------------'
        puts 'The Game\'s list is empty'
        puts '---------------------------------------------'
      else
        games_list.map do |game|
          puts '---------------------------------------------'
          puts "Multiplayer: #{game.multiplayer} - Last Played: #{game.last_played}"
          puts '---------------------------------------------'
        end
      end
    end

    def add_game_list(game_list, game)
        game_list.push(game)
        puts '---------------------------------------------'
        puts 'The Game List created successfully!'
        puts '---------------------------------------------'
    end
end