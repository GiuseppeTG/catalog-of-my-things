class Item
    attr_accessor :id,  :publish_date, :archived, :author
    attr_reader  :genre, :label


    def initialize(id, publish_date, archived)
        @title = id
        @publish_date = publish_date
        @archived = archived
    end


    def can_be_archived?()
        return true if @publish_date > 10
    end

    #to fill both way relationship
    
    def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
    end

    private

    def move_to_archive()
    # resue method should be implemented based on the requirement given
        can_be_archived? || reuse?
    end
end