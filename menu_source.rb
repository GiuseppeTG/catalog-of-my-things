require_relative './source'

class MenuSource
  def source_options(item, sources)
    puts 'Do you want to add a source to this item? [Y/N]'
    answer = gets.chomp.upcase
    return if %w[N NO].include?(answer)

    until %w[Y YES N NO].include?(answer)
      print 'Wrong option, please enter [Y/N] '
      answer = gets.chomp.upcase
    end
    %w[Y YES].include?(answer)

    puts 'Enter the source name'
    input_source_name = gets.chomp.capitalize
    source = sources.find { |src| src['name'] == input_source_name }
    new_source = if source
                   Source.new(source['name'], source['id'])
                 else
                   Source.new(input_source_name)
                 end
    item.add_source(new_source)
    sources << new_source unless source
  end
end
