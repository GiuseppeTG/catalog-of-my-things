require_relative '../movie'

describe Movie do
  context 'When created' do
    it 'should have defined properties' do
      title = 'The Shawshank Redemption'
      publish_date = '2022-10-10'

      movie = Movie.new(title, publish_date)
      expect(movie.title).to be title
      expect(movie.publish_date).to be publish_date
      expect(movie.silent).to be false
    end
  end
end
