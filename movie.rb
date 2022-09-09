require 'json'
require_relative './item'

class Movie < Item
  attr_reader :title, :publish_date, :silent

  def initialize(title, publish_date, silent: false)
    super(title, publish_date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'title' => @title,
      'label' => @label ? ['id' => @label.id, 'title' => @label.title, 'color' => @label.color] : nil,
      'author' => @author ? ['id' => @author.id, 'first_name' => @author.first_name, 'last_name' => author.last_name] : nil,
      'genre' => @genre ? ['id' => @genre.id, 'name' => @genre.name] : nil,
      'source' => @source ? ['id' => @source.id, 'name' => @source.name] : nil
    }.to_json(*args)
  end

  def self.json_create(movie)
    new(movie['id'], movie['title'], movie['publish_date'], movie['archived'],
        movie['author'], movie['label'], movie['genre'], movie['source'])
  end
end
