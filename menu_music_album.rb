require_relative './music_album'

class MenuMusicAlbum
  def music_album_options
    puts 'Adding a Music Album...'
    puts 'Enter the title of the Music Album?'
    input_title = gets.chomp
    puts 'Enter the publish date of the Music Album'
    input_publish_date = gets.chomp
    music_album = MusicAlbum.new(input_title, input_publish_date)
    if music_album.can_be_archived?
      puts 'Do you want to archive the Music Album? [Y/N]'
      answer = gets.chomp.upcase
      return if %w[N NO].include?(answer)

      until %w[Y YES N NO].include?(answer)
        print 'Wrong option, please enter [Y/N] '
        answer = gets.chomp.upcase
      end
      %w[Y YES].include?(answer)
      music_album.move_to_archive
    end
    music_album
  end
end
