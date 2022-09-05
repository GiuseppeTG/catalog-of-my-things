require 'date' # date class for applying archive

class Item
  attr_accessor :publish_date
  attr_reader :id, :genre, :author, :label, :archived

  def initialize(publish_date, id = nil)
    @id = id || Random.rand(1..1_000_000)
    @publish_date = publish_date
    @archived = false # by default, item archived is automatically set as false. It can be changed with method.
  end

  def can_be_archived?
    DateTime.now.year - Date.parse(publish_date).year > 10 # calculate how old is an item
  end

  def move_to_archive
    @archived = true if can_be_archived? # can be archived if it is 10 years old
  end

  def add_genre(genre)
    @genre = genre # set the genre as property of the object
    # add_item (method of genre, author, label) should take an instance of the Item class as an input.
    # all classes (genre, author and label should have an item collection (items = []))
    genre.add_item(self) unless genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end
end

publish_date = '1995-04-10'
p DateTime.now.year
p Date.parse(publish_date).year
p DateTime.now.year - Date.parse(publish_date).year

item1 = Item.new('2020-01-01')
p item1.can_be_archived?
