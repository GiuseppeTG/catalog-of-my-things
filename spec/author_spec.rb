require 'rspec'
require_relative '../game'
require_relative '../author'

describe 'Author class' do
  game = Game.new('game_title', '2022-12-24', 1, true)
  author = Author.new('Waqas', 'Ahmad')
  it 'Has an id' do
    expect(author.id).to be_truthy
  end
  it 'Has an item' do
    author.add_item(game)
    expect(author.items[0]).to be(game)
  end
end
