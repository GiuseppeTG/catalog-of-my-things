require 'rspec'
require_relative '../music_album'
require_relative '../label'

describe 'music_album class' do
  music_album = MusicAlbum.new('the wall', '1977-01-01')
  label = Label.new('new', 'green')
  it 'Has an id' do
    expect(music_album.id).to be_truthy
  end
  it 'Can be archived' do
    expect(music_album.can_be_archived?).to be true
  end
  it 'Archive' do
    music_album.move_to_archive
    expect(music_album.archived).to be true
  end
  it 'Add a label' do
    music_album.add_label(label)
    expect(music_album.label.id).to be_truthy
  end
end
