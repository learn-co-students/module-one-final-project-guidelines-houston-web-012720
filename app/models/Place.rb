class Place < ActiveRecord::Base
    has_many :place_tag_joiners
    has_many :tags, through: :place_tag_joiners
    has_many :pages
    has_many :matches, through: :pages
    has_many :keywords, through: :matches
    
    def relevance
        self.tags.reduce(0) {|memo, tag| tag.relevance ? memo + tag.relevance : memo}
    end

    def is_internal_link?(link)
       ["https://nypizzeria.com/menu/eating-well/",
       "https://nypizzeria.com",
       "https://nypizzeria.com/menu/gluten-free/",
       "https://nypizzeria.com/menu/nutritional-info/",
       "https://nypizzeria.com/catering/pizza-party-2/",
       "https://nypizzeria.com/catering/family-style/",
       "https://nypizzeria.com/catering/corporate-catering/",
       "https://nypizzeria.com/catering/school-special-events/",
       "https://nypizzeria.com/catering/hand-crafted-sandwiches-2/",
       "https://nypizzeria.com/franchise/blog-news/",
       "https://nypizzeria.com/franchise/request-for-brochure/",
       "https://nypizzeria.com/about-us/in-the-news/",
       "https://nypizzeria.com/about-us/media/cooking-lessons/",
       "https://nypizzeria.com/about-us/careers/"].include?(link)

    end


    def self.get_10_most_relevant
        Place.all.sort { |a,b|
            b.relevance <=> a.relevance
        }.first(10)
    end

    def tag_titles #returns all tag names associated with place
        self.tags.map {|tag| tag.title}
    end
end