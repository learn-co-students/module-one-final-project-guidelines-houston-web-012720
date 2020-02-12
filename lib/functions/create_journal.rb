require_relative 'global'
require 'pry'

#student_id = $current_student_id
#lecture_id = lecture_id
#date_created = 
what_did_i_learn = $prompt.ask("What did you learn?")
what_was_unclear = $prompt.ask("What was not clear?")
confidence_level = $prompt.select('How confident are you in the material?', [1, 2, 3, 4, 5])
feelings_on_topic = $prompt.ask("How did you feel on the topic discussed?")
feelings_general = $prompt.ask("How do you personally feel today?")
mood = $prompt.select("What is your mood?", [1, 2, 3, 4, 5])

# $current_student_id = 1

j1 = JournalEntry.new(student_id: $current_student_id, what_did_i_learn: what_did_i_learn, what_was_unclear: what_was_unclear, confidence_level: confidence_level, feelings_on_topic: feelings_on_topic, feelings_general: feelings_general, mood: mood)

binding.pry
0
# JournalEntry.create(student_id: $current_student_id, lecture_id: 1, date_created: 00000000, what_did_i_learn: "test", what_was_unclear: "nothing", confidence_level: 3, feelings_on_topic: "Happy", feelings_general: "Unhappy", mood: 5)

