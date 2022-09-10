require_relative '../source'
require_relative '../item'

describe Source do
  context 'When created' do
    it 'should have defined properties' do
      name = 'Wikipedia'

      source = Source.new(name)
      expect(source.name).to be name
      expect(source.items.empty?).to be true
    end
  end

  context 'When an item is added' do
    name = 'Wikipedia'
    title = 'The Shawshank Redemption'
    publish_date = '2009-10-10'

    it 'number of items increments' do
      source = Source.new(name)
      item = Item.new(title, publish_date)
      items_length = source.items.length
      source.add_item(item)

      expect(source.items.length).to be items_length + 1
    end
  end
end
