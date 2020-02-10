class Journal_entries < ActiveRecord::Base
    belongs_to :student
    belongs_to :lecture
end