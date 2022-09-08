require 'rspec'
require_relative '../book'
require_relative '../label'

describe 'book class' do
  book = Book.new('1984', '2000-12-24', 'someone', 'bad')
  label = Label.new('new', 'green')
  it 'Has an id' do
    expect(book.id).to be_truthy
  end
  it 'Can be archived' do
    expect(book.can_be_archived?).to be true
  end
  it 'Archive' do
    book.move_to_archive
    expect(book.archived).to be true
  end
  it 'Add a label' do
    book.add_label(label)
    expect(book.label.id).to be_truthy
  end
end
