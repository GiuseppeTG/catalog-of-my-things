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
    puts input_cover_state
    Book.new(input_title, input_publish_date, input_publisher, input_cover_state)
  end
end
