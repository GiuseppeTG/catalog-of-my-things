# rubocop:disable Metrics/CyclomaticComplexity
require 'json'
require_relative './book'
require_relative './main_menu'
require_relative './label'
require_relative './game'
require_relative './author'
require_relative './menu_label'
require_relative './menu_book'

class App
  def initialize
    @items = read_file('data/items.json')['items']
    @genres = read_file('data/genres.json')['genres']
    @authors = read_file('data/authors.json')['authors']
    @labels = read_file('data/labels.json')['labels']
    @sources = read_file('data/sources.json')['sources']
  end

  def read_file(file_name)
    JSON.parse(File.read(file_name))
  end

  def init
    initialize
    MainMenu.new.display_main_menu
    option = gets.chomp.to_i
    run_option(option)
  end

  def write_items
    File.open('data/items.json', 'w') do |f|
      data_hash = { 'items' => @items }
      json = JSON.pretty_generate(data_hash)
      f.write(json)
    end
  end

  def write_files
    files = [

      { name: 'items', data: @items },
      { name: 'genres', data: @genres },
      { name: 'authors', data: @authors },
      { name: 'labels', data: @labels },
      { name: 'sources', data: @sources }

    ]

    files.each do |file|
      File.open("data/#{file[:name]}.json", 'w') do |f|
        data_hash = { file[:name] => file[:data] }
        json = JSON.pretty_generate(data_hash)
        f.write(json)
      end
    end
  end

  def run_option(option)
    case option
    when 0 then list_books
    when 1 then list_music_albums
    when 2 then list_games
    when 3 then list_genres
    when 4 then list_labels
    when 5 then list_authors
    when 6 then list_sources
    when 7 then add_book
    when 8 then add_music_album
    when 9 then add_game
    when 10 then add_movie
    when 11 then quit_app
    when 12 then add_author
    else p 'Please enter a valid option, number from 0 to 11'
         init
    end
  end

  def list_books
    p 'List of books'
    books = @items.select { |item| item['json_class'] == 'Book' }
    books.each do |book|
      print "Title: #{book['title']} "
      print "Author: #{book['author'][0]['first_name']} #{book['author'][0]['last_name']} " if book['author']
      print "Genre: #{book['genre'][0]['name']} " if book['genre']
      print "Label: #{book['label'][0]['title']} (#{book['label'][0]['color']}) " if book['label']
      print "Source: #{book['source'][0]['name']} " if book['source']
    end
  end

  def list_music_albums
    p 'List of music albums'
    init
  end

  def list_games
    p 'List of games'
    init
  end

  def list_genres
    p 'List of genres'
    init
  end

  def list_labels
    p 'List of labels'
    init
  end

  def list_authors
    p 'List of authors'
    init
  end

  def list_sources
    p 'List of sources'
    init
  end

  def add_book
    book = MenuBook.new.book_options
    MenuLabel.new.label_options(book, @labels)
    @items << book
    write_files
    init
  end

  def add_music_album
    p 'Adding a music album...'
    init
  end

  def add_game
    puts 'Adding a new game...'

    puts 'Enter the title of the game?'
    input_title = gets.chomp

    puts 'Enter the publish date of the game(yyyy-mm-dd)'
    input_publish_date = gets.chomp

    puts 'Is this game multiplaye? [Y/N]'
    input_multiplayer = gets.chomp

    puts 'How much time ago it was last used? (no of years?)'
    input_last_used = gets.chomp

    game = Game.new(input_title, input_publish_date, input_multiplayer, input_last_used)

    puts 'Do you want to add a label to the Game? [Y/N]'
    input_label_option = gets.chomp.capitalize
    p input_label_option
    puts 'Enter a label title'
    input_label_title = gets.chomp
    puts 'Enter a label color'
    input_label_color = gets.chomp
    label = Label.new(input_label_title, input_label_color)
    game.add_label(label)
    @labels << label
    # need to be fixed
    # game.move_to_archive
    @items << game
    write_files
    puts 'New Game Successfully Created'
    init
  end

  def add_movie
    p 'Adding a movie...'
    init
  end

  def quit_app
    p 'Thanks for usig this App, Bye'
  end

  def add_author
    puts 'Adding a new Author...'

    puts 'Enter the First Name ?'
    input_first_name = gets.chomp

    puts 'Enter the Last Name ?'
    input_last_name = gets.chomp

    # puts 'which books this author own'
    # input_books = gets.chomp

    author = Author.new(input_first_name, input_last_name)

    @authors << author
    write_files
    init
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
