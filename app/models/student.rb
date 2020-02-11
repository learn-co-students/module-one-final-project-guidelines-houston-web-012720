class Student < ActiveRecord::Base
    belongs_to :cohort
    has_many :journal_entries
    has_many :lectures, through: :journal_entries
end