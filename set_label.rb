require 'ostruct'

class SetLabel
  def label_options(item, labels)
    p item
    p labels
    puts 'Do you want to add a label to the book? [Y/N]'
    answer = gets.chomp.upcase
    return if %w[N NO].include?(answer)

    until %w[Y YES N NO].include?(answer)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp.upcase
    end
    %w[y yes true].include?(answer.downcase)

    puts 'Enter a label title'
    input_label_title = gets.chomp.capitalize
    puts 'Enter a label color'
    input_label_color = gets.chomp.capitalize
    label = labels.find { |lab| lab['title'] == input_label_title && lab['color'] == input_label_color }
    if label
      item.add_label(label)
    else
      label = Label.new(input_label_title, input_label_color)
      item.add_label(label)
      labels << label
    end
  end
end
