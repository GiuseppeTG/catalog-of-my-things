require_relative './menu_label'
require_relative './menu_genre'
require_relative './menu_author'
require_relative './menu_source'

class Details
  def details_options(item_name, labels, genres, authors, sources)
    MenuLabel.new.label_options(item_name, labels)
    MenuGenre.new.genre_options(item_name, genres)
    MenuAuthor.new.author_options(item_name, authors)
    MenuSource.new.source_options(item_name, sources)
  end
end
