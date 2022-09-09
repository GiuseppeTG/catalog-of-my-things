require 'rspec'
require_relative '../book'
require_relative '../genre'

describe 'Genre class' do
  music_album = MusicAlbum.new('the wall', true)
  genre = Genre.new('progressive rock')
  it 'Has an id' do
    expect(genre.id).to be_truthy
  end
  it 'Has an item' do
    genre.add_item(music_album)
    expect(genre.items[0]).to be(music_album)
  end
end
