# rubocop:disable Metrics/CyclomaticComplexity
require_relative './app'
class MenuOptions
  def run_option(option)
    app = App.new
    case option
    when 0 then app.list_books
    when 1 then app.list_music_albums
    when 2 then app.list_games
    when 3 then app.list_genres
    when 4 then app.list_labels
    when 5 then app.list_authors
    when 6 then app.list_sources
    when 7 then app.add_book
    when 8 then app.add_music_album
    when 9 then app.add_game
    when 10 then app.add_movie
    when 11 then app.quit_app
    else p 'Please enter a valid option, number from 0 to 11'
         app.init
    end
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
