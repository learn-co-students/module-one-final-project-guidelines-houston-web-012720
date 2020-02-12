require 'pry'
require_relative 'global'

$current_student_id = 1
$current_student = Student.find($current_student_id)

student_journals = $current_student.journal_entries.map{|entry| "Lecture: #{entry.lecture.name} | Date Created: #{entry.date_created} | What I Learned: #{entry.what_did_i_learn[0..13]}..."}
# puts "Displaying Journal Entries for #{$current_student.username}"
# puts student_journals

$prompt.select("What Journal do you want to view/modify?", student_journals)
# binding.pry
0
