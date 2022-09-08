class MenuGenre
  def genre_options(item, genres)
    puts 'Do you want to add a genre to the book? [Y/N]'
    answer = gets.chomp.upcase
    return if %w[N NO].include?(answer)

    until %w[Y YES N NO].include?(answer)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp.upcase
    end
    %w[Y YES].include?(answer)

    puts 'Enter a genre name'
    input_genre_name = gets.chomp.capitalize
    genre = genres.find { |lab| lab['name'] == input_genre_name }
    new_genre = if genre
                  Genre.new(genre['name'], genre['id'])
                else
                  Genre.new(input_genre_name)
                end
    item.add_genre(new_genre)
    genres << new_genre unless genre
  end
end
