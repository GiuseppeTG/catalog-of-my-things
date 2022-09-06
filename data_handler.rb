module Datahandler
    def save_game(game_list)
        File.write('data/games.json', '', mode: 'w')
        game_list.each do |data|
          array_game = [data.multiplayer, data.last_played_at]
          data_game = JSON.generate(array_game)
          File.write('data/games.json', "#{data_game}\n", mode: 'a')
        end
        puts 'Game List saved successfully!'
    end

    def save_author(author_list)
        File.write('data/authors.json', '', mode: 'w')
        author_list.each do |data|
          array_author = [data.id, data.first_name, data.last_name, data.item]
          data_author = JSON.generate(array_author)
          File.write('data/authors.json', "#{data_author}\n", mode: 'a')
        end
        puts 'Author List saved successfully!'
    end

    def read_games
        return [] unless File.exist?('data/games.json') && !File.zero?('data/games.json')
    
        games_list = []
        File.foreach('data/games.json') do |game_json|
          game = JSON.parse(game_json)
          # need to get and save the game
            new_game = Game.new(game[0],game[1])
            games_list.push(new_game)
          end
        games_list
    end

    def read_authors
        return [] unless File.exist?('data/authors.json') && !File.zero?('data/authors.json')
    
        authors_list = []
        File.foreach('data/authors.json') do |author_json|
          author = JSON.parse(author_json)
          new_author = author.new(author[0], author[1])
          authors_list.push(new_author)
        end
        authors_list
    end


end