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
    when 3 then list_genres
    when 4 then list_labels
    when 5 then list_authors
    when 6 then list_sources
    when 7 then add_book
    when 8 then add_music_album
    when 9 then add_game
    when 10 then add_movie
    when 11 then quit_app
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
      print "Source: #{book['source'][0]['name']}" if book['source']
    end
    p 'Press any key to continue'
    gets.chomp
    init
  end

  def list_music_albums
    p 'List of music albums'
    music_albums = @items.select { |item| item['json_class'] == 'MusicAlbum' }
    music_albums.each do |music_album|
      print "Title: #{music_album['title']} "
      print "Author: #{music_album['author'][0]['first_name']} #{music_album['author'][0]['last_name']} " if music_album['author']
      print "Genre: #{music_album['genre'][0]['name']} " if music_album['genre']
      print "Label: #{music_album['label'][0]['title']} (#{music_album['label'][0]['color']}) " if music_album['label']
      print "Source: #{music_album['source'][0]['name']} " if music_album['source']
    end
    p 'Press any key to continue'
    gets.chomp
    init
  end

  def list_games
    p 'List of games'
    games = @items.select { |item| item['json_class'] == 'Game' }
    games.each do |game|
      print "Title: #{game['title']} "
      print "Author: #{game['author'][0]['first_name']} #{game['author'][0]['last_name']} " if game['author']
      print "Genre: #{game['genre'][0]['name']} " if game['genre']
      print "Label: #{game['label'][0]['title']} (#{game['label'][0]['color']}) " if game['label']
      print "Source: #{game['source'][0]['name']}" if game['source']
      print "Multiplayer: #{game['multiplayer']}" if game['multiplayer']
      print "Last Played: #{game['last_played']}" if game['last_played']
    end
    p 'Press any key to continue'
    gets.chomp
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

  def list_movies
    p 'List of movies'
    movies = @items.select { |item| item['json_class'] == 'Movie' }
    movies.each do |movie|
      print "Title: #{movie['title']} "
      print "Author: #{movie['author'][0]['first_name']} #{movie['author'][0]['last_name']} " if movie['author']
      print "Genre: #{movie['genre'][0]['name']} " if movie['genre']
      print "Label: #{movie['label'][0]['title']} (#{movie['label'][0]['color']}) " if movie['label']
      print "Movie: #{movie['movie'][0]['name']}" if movie['movie']
    end
    p 'Press any key to continue'
    gets.chomp
    init
  end

  def add_book
    book = MenuBook.new.book_options
    MenuLabel.new.label_options(book, @labels)
    MenuSource.new.label_options(book, @sources)
    @items << book
    write_files
    init
  end

  def add_music_album
    music_album = MenuMusicAlbum.new.music_album_options
    MenuLabel.new.label_options(music_album, @labels)
    MenuGenre.new.genre_options(music_album, @genres)
    @items << music_album
    write_files
    init
  end
  
  def add_game
    game = MenuGame.new.game_options
    MenuLabel.new.label_options(game, @labels)
    MenuAuthor.new.author_options(game, @authors)
    @items << game
    write_files
    init
  end
  
  def add_movie
    p 'Adding a movie...'
    movie = MenuMovie.new.Movie_options
    MenuMovie.new.label_options(movie, @labels)
    @items << movie
    write_files
    init
  end

  def quit_app
    p 'Thanks for usig this App, Bye'
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
