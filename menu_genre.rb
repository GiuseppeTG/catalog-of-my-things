class MenuGenre
  def genre_options(item, genres)
    puts 'Do you want to add a genre to the music album? [Y/N]'
    answer = gets.chomp.upcase
    return if %w[N NO].include?(answer)

    until %w[Y YES N NO].include?(answer)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp.upcase
    end
    %w[Y YES].include?(answer)

    puts 'Enter a genre name'
    input_genre_name = gets.chomp.capitalize

    genre = Genre.new(input_genre_name)

    item.add_genre(genre)
    genres << genre
  end
end
