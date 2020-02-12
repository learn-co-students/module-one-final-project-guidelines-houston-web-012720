Student.destroy_all
Cohort.destroy_all
JournalEntry.destroy_all
Lecture.destroy_all

Cohort.create(program_type: "Software Engineering", start_date: 2020-01-27, location: "Houston")

Lecture.create(name: "Intro to Ruby", date: 2020-01-27, teacher: "Vidhi", module: 1)
Lecture.create(name: "Ruby Methods", date: 2020-01-28, teacher: "Vidhi", module: 1)
Lecture.create(name: "Ruby Classes", date: 2020-01-29, teacher: "Vidhi", module: 1)


Student.create(cohort_id: 1, first_name: "Stephen", last_name: "Williams", age: 32, gender: "male", username: "sterobwms", password: "guest")
Student.create(cohort_id: 1, first_name: "Caleb", last_name: "Rutland", age: 25, gender: "male", username: "drvondevious", password: "guest")
Student.create(cohort_id: 1, first_name: "Cornelius", last_name: "Omowaiye", age: 25, gender: "male", username: "corn-cloud", password: "guest")


JournalEntry.create(student_id: 1, lecture_id: 1,what_did_i_learn: "Ruby yay", what_was_unclear: "It's not a gemstone?", confidence_level: 4, feelings_on_topic: "Funky Fresh", feelings_general: "So Fresh, So Clean", mood: 4)
JournalEntry.create(student_id: 2, lecture_id: 1, what_did_i_learn: "asksng", what_was_unclear: "nothing", confidence_level: 3, feelings_on_topic: "Looks gud", feelings_general: "Roses", mood: 2)
JournalEntry.create(student_id: 3, lecture_id: 2, what_did_i_learn: "test for complete", what_was_unclear: "the fog", confidence_level: 3, feelings_on_topic: "the funnestest language", feelings_general: "Hey Ya", mood: 4)
JournalEntry.create(student_id: 1, lecture_id: 2, what_did_i_learn: "Ruby nay", what_was_unclear: "It has gems?", confidence_level: 1, feelings_on_topic: "Fruit is not a grape", feelings_general: "Miss Jackson", mood: 5)
JournalEntry.create(student_id: 1, lecture_id: 3, what_did_i_learn: "Use attr_accessor", what_was_unclear: "How to make a deck of cards", confidence_level: 5, feelings_on_topic: "I like typing less. Das ist gut.", feelings_general: "hungry", mood: 2)
