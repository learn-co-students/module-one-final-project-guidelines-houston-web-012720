# puts $current_student_id

def id_test
    if !Student.find($current_student_id)
        puts 'n/a'
    else
        Student.find($current_student_id).id
    end
end