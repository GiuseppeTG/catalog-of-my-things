require_relative './book'

class MenuBook
  def book_options
    puts 'Adding a book...'
    puts 'Enter the title of the book?'
    input_title = gets.chomp
    puts 'Enter the publish date of the book'
    input_publish_date = gets.chomp
    puts 'Enter the publisher of the book'
    input_publisher = gets.chomp
    puts 'Enter the cover state of the book [bad / good]'
    input_cover_state = gets.chomp
    book = Book.new(input_title, input_publish_date, input_publisher, input_cover_state)
    if book.can_be_archived?
      puts 'Do you want to archive the book? [Y/N]'
      answer = gets.chomp.upcase
      return if %w[N NO].include?(answer)

      until %w[Y YES N NO].include?(answer)
        print 'Wrong option, please enter [Y/N] '
        answer = gets.chomp.upcase
      end
      %w[Y YES].include?(answer)
      book.move_to_archive
    end
    book
  end
end
