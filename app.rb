# rubocop:disable Metrics/CyclomaticComplexity
require 'json'
require_relative './lib/book'
require_relative './lib/main_menu'

class App
  def initialize
    @items = read_file('data/items.json')['items']
    @genres = read_file('data/items.json')
    @authors = read_file('data/items.json')
    @labels = read_file('data/items.json')
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
    init
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
    p 'Adding a book...'
    init
  end

  def add_music_album
    p 'Adding a music album...'
    init
  end

  def add_game
    p 'Adding a game...'
    init
  end

  def add_movie
    p 'Adding a movie...'
    init
  end

  def quit_app
    p 'Thanks for usig this App, Bye'
  end
end
# rubocop:enable Metrics/CyclomaticComplexity