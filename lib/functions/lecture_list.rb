require 'pry'
require_relative 'global'

$current_student_id = Student.first.id
$current_student = Student.find($current_student_id)
lecture_list = Lecture.all.map{|lecture| "#{lecture.name} - #{lecture.date}"}

# binding.pry

selected_lecture = $prompt.select("Select a lecture", lecture_list)

until $prompt.yes?(selected_lecture)
    selected_lecture = $prompt.select("Select a lecture", lecture_list)
end

puts "Opening #{selected_lecture}"



# binding.pry
0