class Tag < ActiveRecord::Base
    has_many :place_tag_joiners
    has_many :places, through: :place_tag_joiners


    def self.get_tag_names
        self.all.map {|tag| tag.title}
    end

    def self.create_or_return_tag(title)
        if Tag.get_tag_names.include?(title)
            self.all.find_by(title: title)
        else
            Tag.create(title: title)
        end
    end

    def self.categories
        Tag.all.map { |tag|
            tag.group
        }.uniq
    end


end