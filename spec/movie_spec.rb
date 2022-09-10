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

  context 'When date published is older than 10 years' do
    title = 'The Shawshank Redemption'
    publish_date = '2009-10-10'

    it 'it can be archived' do
      movie = Movie.new(title, publish_date)
      expect(movie.can_be_archived?).to be true
    end
  end

  context 'When date published is less than 10 years' do
    title = 'The Shawshank Redemption'
    publish_date = '2020-10-10'

    it 'it can be archived if silent' do
      movie = Movie.new(title, publish_date, silent: true)
      expect(movie.can_be_archived?).to be true
    end
    it 'it cannot be archived if not silent' do
      movie = Movie.new(title, publish_date, silent: false)
      expect(movie.can_be_archived?).to be false
    end
  end
end
