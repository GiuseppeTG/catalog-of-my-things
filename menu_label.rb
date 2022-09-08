class MenuLabel
  def label_options(item, labels)
    puts 'Do you want to add a label to the book? [Y/N]'
    answer = gets.chomp.upcase
    return if %w[N NO].include?(answer)

    until %w[Y YES N NO].include?(answer)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp.upcase
    end
    %w[Y YES].include?(answer)

    puts 'Enter a label title'
    input_label_title = gets.chomp.capitalize
    puts 'Enter a label color'
    input_label_color = gets.chomp.capitalize
    label = labels.find { |lab| lab['title'] == input_label_title && lab['color'] == input_label_color }
    new_label = if label
                  Label.new(label['title'], label['color'], label['id'])
                else
                  Label.new(input_label_title, input_label_color)
                end
    item.add_label(new_label)
    labels << new_label unless label
  end
end
