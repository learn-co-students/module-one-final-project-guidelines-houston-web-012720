require 'pry'
require_relative 'global'
require_relative 'journal_entry'

$current_student_id = 1

def make_journal_hash
    journal_hash = {}
    JournalEntry.all.each do |entry|
        journal_hash[entry.lecture.name] = id
    end
    lecture_hash
end

student_journals = $current_student.journal_entries.map{|entry| "Lecture: #{entry.lecture.name} | Date Created: #{entry.created_at} | What I Learned: #{entry.what_did_i_learn[0..13]}..."}
# puts "Displaying Journal Entries for #{$current_student.username}"
# puts student_journals

$current_journal_id = $prompt.select("What Journal do you want to view/modify?", student_journals)

display_journal_entry($current_journal_id)

# binding.pry
0
