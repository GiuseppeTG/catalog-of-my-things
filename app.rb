# rubocop:disable Metrics/CyclomaticComplexity
require 'json'
require_relative './menu_label'
require_relative './menu_book'
require_relative './main_menu'
require_relative './menu_game'
require_relative './menu_author'
require_relative './menu_music_album'
require_relative './menu_genre'
require_relative './menu_source'
require_relative './menu_movie'
require_relative './add_details'
require_relative './list_items'
require_relative './book'
require_relative './label'
require_relative './game'
require_relative './author'
require_relative './genre'

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
    when 3 then list_movies
    when 4 then list_genres
    when 5 then list_labels
    when 6 then list_authors
    when 7 then list_sources
    when 8 then add_book
    when 9 then add_music_album
    when 10 then add_game
    when 11 then add_movie
    when 12 then quit_app
    else p 'Please enter a valid option, number from 0 to 11'
         init
    end
  end

  def list_books
    name = 'Book'
    ListItems.new.print_items(name, @items)
    init
  end

  def list_music_albums
    name = 'MusicAlbum'
    ListItems.new.print_items(name, @items)
    init
  end

  def list_games
    name = 'Game'
    ListItems.new.print_items(name, @items)
    init
  end

  def list_movies
    name = 'Movie'
    ListItems.new.print_items(name, @items)
    init
  end

  def list_genres
    p 'List of genres'
    @genres.each do |gen|
      puts "Title: #{gen['name']} - Id: #{gen['id']}"
    end
    p 'Press any key to continue'
    gets.chomp
    init
  end

  def list_labels
    p 'List of labels'
    @labels.each do |lab|
      puts "Title: #{lab['title']} - Color: #{lab['color']} - Id: #{lab['id']}"
    end
    p 'Press any key to continue'
    gets.chomp
    init
  end

  def list_authors
    p 'List of Authors'
    @authors.each do |author|
      puts "First Name: #{author['first_name']} - Last Name: #{author['last_name']} - Id: #{author['id']}"
    end
    p 'Press any key to continue'
    gets.chomp
    init
  end

  def list_sources
    p 'List of sources'
    @sources.each do |src|
      puts "Name: #{src['name']}"
    end
    p 'Press any key to continue'
    gets.chomp
    init
  end

  def add_book
    book = MenuBook.new.book_options
    Details.new.details_options(book, @labels, @genres, @authors, @sources)
    @items << book
    write_files
    init
  end

  def add_music_album
    music_album = MenuMusicAlbum.new.music_album_options
    Details.new.details_options(music_album, @labels, @genres, @authors, @sources)
    @items << music_album
    write_files
    init
  end

  def add_game
    game = MenuGame.new.game_options
    Details.new.details_options(game, @labels, @genres, @authors, @sources)
    @items << game
    write_files
    init
  end

  def add_movie
    movie = MenuMovie.new.movie_options
    Details.new.details_options(movie, @labels, @genres, @authors, @sources)
    @items << movie
    write_files
    init
  end

  def quit_app
    p 'Thanks for usig this App, Bye'
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
