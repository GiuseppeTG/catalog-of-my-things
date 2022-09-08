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
end
