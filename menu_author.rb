class MenuAuthor
    def author_options(item, authors)
      puts 'Do you want to add an Author to the Item? [Y/N]'
      answer = gets.chomp.upcase
      return if %w[N NO].include?(answer)
  
      until %w[Y YES N NO].include?(answer)
        print 'Wrong option, please enter [Y/N] '
        answer = gets.chomp.upcase
      end
      %w[Y YES].include?(answer)
  
      puts 'Enter First Name'
      input_first_name = gets.chomp.capitalize
      puts 'Enter Last Name'
      input_last_name = gets.chomp.capitalize
      author = authors.find { |aut| aut['first_name'] == input_first_name && aut['last_name'] == input_last_name }
      new_author = if author
                    Author.new(author['first_name'], author['last_name'], author['id'])
                  else
                    Author.new(input_first_name, input_last_name)
                  end
      item.add_author(new_author)
      authors << new_author unless author
    end
end
  