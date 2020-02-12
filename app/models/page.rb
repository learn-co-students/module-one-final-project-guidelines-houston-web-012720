class Page < ActiveRecord::Base
    belongs_to :place
    has_many :matches
    has_many :keywords, through: :matches

    def visit
        rawtext = open(self.url).read

    end

    def self.iterate_all
        if Keyword.count > 0
            Place.where.not(website: nil).each{ |place|
                page = Page.find_or_create_by(place_id: place.id, url: place.website)
                while Page.where("place_id = ? AND visited = ?", place.id, false).count > 0
                    Page.where("place_id = ? AND visited = ?", place.id, false).first.visit
                end
            }
        end
    end
end