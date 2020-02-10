class Tag < ActiveRecord::Base
    has_many :place_tag_joiners
    has_many :places, through: :place_tag_joiners
end