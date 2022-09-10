require 'rspec'
require_relative '../game'
require_relative '../label'

describe 'Game class' do
  game = Game.new('title', '2000-12-24', 3, true)
  label = Label.new('new', 'green')
  it 'Has an id' do
    expect(game.id).to be_truthy
  end
  it 'Can be archived' do
    expect(game.can_be_archived?).to be true
  end
  it 'Archive' do
    game.move_to_archive
    expect(game.archived).to be true
  end
  it 'Add a label' do
    game.add_label(label)
    expect(game.label.id).to be_truthy
  end
end
