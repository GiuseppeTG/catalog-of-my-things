require_relative './source'

class MenuMovie
  def movie_options
    puts 'Adding a movie...'
    puts 'Enter the title of the movie?'
    input_title = gets.chomp
    puts 'Enter the publish date of the movie'
    input_publish_date = gets.chomp
    puts 'Is the movie silent? [Y/N]'
    input_silent_state = gets.chomp.upcase
    until %w[Y YES N NO].include?(answer)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp.upcase
    end
    silent_state = %w[N NO].include?(input_silent_state) ? false : true

    movie = Movie.new(input_title, input_publish_date)
    if movie.can_be_archived?
      puts 'Do you want to archive the book? [Y/N]'
      answer = gets.chomp.upcase
      return if %w[N NO].include?(answer)

      until %w[Y YES N NO].include?(answer)
        print 'Wrong option, please enter [Y/N] '
        answer = gets.chomp.upcase
      end
      %w[Y YES].include?(answer)
      movie.move_to_archive
    end
    movie
  end
end
