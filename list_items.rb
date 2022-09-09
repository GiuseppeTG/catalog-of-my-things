class ListItems
  def print_items(name, obj)
    p "List of #{name}s"
    items = obj.select { |item| item['json_class'] == name.to_s }
    items.each do |item|
      print "Title: #{item['title']} "
      print "Author: #{item['author'][0]['first_name']} #{item['author'][0]['last_name']} " if item['author']
      print "Genre: #{item['genre'][0]['name']} " if item['genre']
      print "Label: #{item['label'][0]['title']} (#{item['label'][0]['color']}) " if item['label']
      print "Source: #{item['source'][0]['name']}" if item['source']
    end
    puts "\n Press any key to continue"
    gets.chomp
  end
end
