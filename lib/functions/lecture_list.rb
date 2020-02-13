require 'pry'
require_relative 'global'

# $current_student_id = Student.first.id
# lecture_list = Lecture.all.map{|lecture| "#{lecture.name} - #{lecture.date}"}
def lecture_list_select
    
    def make_lecture_hash
        lecture_hash = {}
        Lecture.all.each do |lecture|
            lecture_hash[lecture.name] = lecture.id
        end
        lecture_hash
    end

    lecture_hash = make_lecture_hash

    # binding.pry

    selected_lecture = $prompt.select("Select a lecture", lecture_hash) 

    until $prompt.yes?(selected_lecture)
        selected_lecture = $prompt.select("Select a lecture", lecture_hash)
    end

    puts "Opening #{lecture_hash.key(selected_lecture)}"
    $current_lecture_id = selected_lecture
end