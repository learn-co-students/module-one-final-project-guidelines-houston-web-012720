require 'pry'

class Place < ActiveRecord::Base
    has_many :place_tag_joiners
    has_many :tags, through: :place_tag_joiners
    has_many :pages
    has_many :matches, through: :pages
    has_many :keywords, through: :matches
    
    def tag_relevance
        self.tags.reduce(0) {|memo, tag| tag.relevance ? memo + tag.relevance : memo}
    end

    def keyword_relevance
        self.matches.reduce(0) {|memo, match| memo + (match.keyword.relevance * match.count)}
    end

    # def distance_relevance_multiplier
    #     1.0 - ((distance) / 2 * (max_distance))
    # end

    def relevance
        # normalized_relevance = (tag_relevance) + (keyword_relevance/(self.keywords.count)
        # final_relevance = normalized_relevance * distance_relevance_multiplier
        tag_relevance + keyword_relevance
    end

    def is_internal_link?(link)
        exceptions = ["www.facebook.com", "www.google.com"]
        link_host = URI.parse(link).host
        link_host.prepend("www.") unless link_host.starts_with?("www.")
        website_host = URI.parse(self.website).host
        website_host.prepend("www.") unless website_host.starts_with?("www.")
        website_host == link_host && !exceptions.include?(link_host)
    end

    def self.get_10_most_tag_relevant
        Place.all.sort { |a,b|
            b.tag_relevance <=> a.tag_relevance
        }.first(10)
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