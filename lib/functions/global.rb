require_relative '../../config/environment'

$prompt = TTY::Prompt.new

def check_update_current_student_id
    if $current_student_id == nil
        $current_student_id = 1
    else
        $current_student_id
    end
end

def check_update_current_journal_id
    if $current_journal_id == nil
        $current_journal_id = 1
    else
        $current_journal_id
    end
end

def check_update_current_lecture_id
    if $current_lecture_id == nil
        $current_lecture_id = 1
    else
        $current_lecture_id
    end
end

# check_update_current_student_id
# $current_student = Student.find($current_student_id)

# check_update_current_journal_id
# $current_journal = JournalEntry.find($current_journal_id)

# check_update_current_lecture_id
# $current_lecture = Lecture.find($current_lecture_id)

def rating_stars(rating)
    "\u2606" * rating
end

def greeting
    username = $prompt.ask("What is your username?")
    puts "Welcome #{username}!"
end

# binding.pry
0