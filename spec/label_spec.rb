require 'rspec'
require_relative '../book'
require_relative '../label'

describe 'Label class' do
  book = Book.new('1984', '2000-12-24', 'someone', 'bad')
  label = Label.new('new', 'green')
  it 'Has an id' do
    expect(label.id).to be_truthy
  end
  it 'Has an item' do
    label.add_item(book)
    expect(label.items[0]).to be(book)
  end
end
