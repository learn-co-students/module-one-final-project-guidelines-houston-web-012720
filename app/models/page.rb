class Page < ActiveRecord::Base
    belongs_to :place
    has_many :matches
    has_many :keywords, through: :matches
end