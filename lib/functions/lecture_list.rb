require 'pry'
require_relative 'global'

$current_student_id = Student.first.id
lecture_list = Lecture.all.map{|lecture| "#{lecture.name} - #{lecture.date}"}

lecture_hash = {}
def make_lecture_hash
    Lecture.all.map do |lecture|
        lecture_hashlecture.name => lecture.id}
end

# binding.pry

$prompt.select("Select a lecture", lecture_hash) 

until $prompt.yes?(selected_lecture)
    selected_lecture = $prompt.select("Select a lecture", lecture_list)
end

puts "Opening #{selected_lecture}"
$current_lecture_id = selected_lecture
# binding.pry
0