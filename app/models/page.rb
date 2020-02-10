class Page < ActiveRecord::Base[6.0]
    belongs_to :place
    has_many :matches
    has_many :keywords, through: :matches
end