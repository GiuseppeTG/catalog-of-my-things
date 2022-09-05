require './app'

def main
  app = App.new
  puts "Catalog of my favorite things\n"
  puts "
  1) List all books
  2) List all music albums
  3) List all games
  4) List all genres
  5) List all labels
  6) List all authors
  7) Add a book
  8) Add a music album
  9) Add a game
  10) EXIT
  "
end

main
