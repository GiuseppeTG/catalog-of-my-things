require_relative './source'

class MenuSource
  def source_options(item, sources)
    puts 'Enter the source name'
    input_source_name = gets.chomp.capitalize
    source = sources.find { |src| src['name'] == input_source_name }
    new_source = if source
                  Source.new(source['name'], source['id'])
                else
                  Label.new(input_source_name)
                end
    item.add_source(new_source)
    sources << new_source unless source
  end
end
