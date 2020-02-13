# require 'pry'
require_relative 'global'
# require_relative 'journal_entry'
def student_journal_list
    # $current_student_id = 1

    # binding.pry

    def journal_hash
        journal_hash = {}
        $current_student.journal_entries.each do |entry|
            journal_hash["Lecture: #{entry.lecture.name} | Date Created: #{entry.created_at} | What I Learned: #{entry.what_did_i_learn[0..13]}..."] = entry.id
        end
        journal_hash
    end

    # p make_journal_hash
    # binding.pry

    selected_journal = $prompt.select("What Journal do you want to view/modify?", journal_hash)

    # p $current_journal_id

    until $prompt.yes?(selected_journal)
        selected_journal = $prompt.select("What Journal do you want to view/modify?", journal_hash)
    end

    $current_journal_id = selected_journal


    # display_journal_entry($current_journal_id)

end
# binding.pry
0
# student_journal_list