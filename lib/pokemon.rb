class Pokemon < ActiveRecord::Base
    belongs_to :areas
    belongs_to :trainers
end
