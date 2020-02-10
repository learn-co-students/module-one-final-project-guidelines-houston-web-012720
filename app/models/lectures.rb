class Lecture < ActiveRecord::Base
    has_many :journal_entries
    has_many :students, through :journal_entries
end