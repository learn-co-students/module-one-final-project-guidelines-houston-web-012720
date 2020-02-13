require_relative 'global'
# require 'pry'

# $current_student_id = 1
#lecture_id = lecture_id
#date_created = 
def create_entry
    JournalEntry.create(student_id: $current_student_id, what_did_i_learn: $prompt.ask("What did you learn?"), what_was_unclear: $prompt.ask("What was not clear?"), confidence_level: $prompt.select('How confident are you in the material?', [1, 2, 3, 4, 5]), feelings_on_topic: $prompt.ask("How did you feel on the topic discussed?"), feelings_general: $prompt.ask("How do you personally feel today?"), mood: $prompt.select("What is your mood?", [1, 2, 3, 4, 5]))
end