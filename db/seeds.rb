# # This file should contain all the record creation needed to seed the database with its default values.

Lesson.destroy_all
User.destroy_all
Assignment.destroy_all
Submission.destroy_all
Grading.destroy_all

require 'faker'

# 12 assignments
  Assignment.create(content: "Hi Everyone! Today we want to hear about your musical taste. Please make sure to create a spoken entry for me to be able to give you feedback on. Everyone has a different take on music. Choose a point and discuss: What is your favorite genre of music and why? Who is your favorite musical artist? Do you enjoy going to concerts? Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know.", title: "Musical Opinion", keywords: "Genre, Musician, Concert, Performance")
  Assignment.create(content: "Hi Everyone! Today we want to hear about your health habits and/or fitness routine. Please make sure to create a spoken entry for me to be able to give you feedback on. Our lifestyles vary drastically. Some of us are in school, in the workforce as employees or managers or business owners, or even full-time parents. Choose a point and discuss: What do you do to maintain your health? How do you keep fit if you are busy? What is your fitness routine like? Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know.", title: "Health and Fitness", keywords: "Exercise, Meditation, Routine, Recovery")
  Assignment.create(content: "Hi Everyone! Today's topic will be discussing your job skills. We each work in a different industry, and have probably worked in several different industries ourselves. Choose a point and discuss: What are the 3 most useful job skills you've gained in your career? Which skills are the most important for your current job? Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know.", title: "Job Skills", keywords: "Prioritization, Dependable, Detail-Oriented, Driven")
  Assignment.create(content: "Hi Everyone! Today's topic will be discussing travel. In today's world, many of us have been lucky enough to travel for fun or work. Choose a point and discuss: Where is your favorite place you have travelled and why? What is your dream destination? Do you have a favorite travel partner? Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know.", title: "Travel Plans", keywords: "Itinerary, Reservations, Visa, Annual Leave (AL)")
  Assignment.create(content: "Hi Everyone! Today we will be discussing our childhoods. Thinking about my childhood, I often think about my best friends, my parents, and having dinner with my family every week. Choose a point and discuss: What is your favorite memory from childhood? Tell me about your best friend from your childhood. Do you remember how you met? Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know.", title: " Childhood", keywords: "Memory, Nostalgic, Rumination")
  Assignment.create(content: "Hi Everyone! Today's topic will be talking about how technology has impacted your life. In our world, it's hard to escape technology. Maybe you use a smartphone every day, or perhaps you use a computer at work. Have you video chatted with a friend in a distant city, or use an app to be more efficient? Choose a point and discuss: What is the biggest impact technology has had on your life? Which technologies are you most looking forward to in the future? Is there one specific technology you hope will be created that doesn't exist yet? Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know.", title: "Life and Technology", keywords: "Futuristic, Optimistic, Pessimistic, Simplicity")
  Assignment.create(content: "Hi Everyone! Today's topic will be talking about the role of relaxation in life. We've talked about lifestyles before and we know we all have different routines. Relaxation plays a role in these routines, whether you consider yourself highly productive, or maybe a bit lazy. Talk about the role relaxation plays in your life and what you like to do to relax. Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know.", title: "Relaxation", keywords: "Burnout, Stamina, Laziness, Serenity")
  Assignment.create(content: "Hi Everyone! Today's topic is all about speaking in a way that people will want to listen. Remember, it's not just WHAT you say, but HOW you say it! Please watch the following TED talk: (http://v.youku.com/v_show/id_XNzQyMzExODI0.html?spm=a2h0k.8191407.0.0&from=s1.8-1-1.2) . After you've watched the video, talk about what main points you'd like to improve are. Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know.", title: "Motivation", keywords: "On track, Encouragment, Persistence, Determination")
  Assignment.create(content: "Hi Everyone! Our topic for today will be talking about motivation. Please make sure to create a spoken entry for me to be able to give you feedback on. We all need to be motivated. Whether you need to be motivated for work, you want to achieve a personal goal (like learning a language), or overcome a challenge, we all need motivational boost from time to time.Choose a point and discuss: What do you do to get back in the zone? Why does this seem to work so well for you? Why does your motivation fade over time? Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know", title: Faker::VentureBros.organization)
  Assignment.create(content: "Hi Everyone! Let's talk about money. We all have financial goals, some more clearly defined than others. Tell us about your financial goals. Do you plan them out week to week, monthly, yearly, or do you have another system? Talk about your goals and how you plan to achieve them. Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know.", title: "Personal Finance", keywords: "Investments, Financial Independence, Savings")
  Assignment.create(content: "Hi Everyone! Let's talk about money. We all have financial goals, some more clearly defined than others. Tell us about your financial goals. Do you plan them out week to week, monthly, yearly, or do you have another system? Talk about your goals and how you plan to achieve them. Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know.", title: "Personal Finance", keywords: "Investments, Financial Independence, Savings")
  Assignment.create(content: "Hi Everyone! Let's talk about money. We all have financial goals, some more clearly defined than others. Tell us about your financial goals. Do you plan them out week to week, monthly, yearly, or do you have another system? Talk about your goals and how you plan to achieve them. Please make sure that you complete the assignment by tomorrow so I can give you feedback. If you have any questions about the assignment or words, please let me know.", title: "Personal Finance", keywords: "Investments, Financial Independence, Savings")


# 1 teacher
teacher = User.create(username: "Adam", email: "kalimi@yahoo.com", password: "teacher", open_id: "oSjX30Nw1q-8y93FGOZXq6WTbOWY", is_teacher: true)

# # 10 students
# 10.times do
#   User.create(username: Faker::LeagueOfLegends.unique.champion, email: Faker::Internet.email, password: "profanity", is_teacher: false)
# end

# # lessons per student
# # every students have random number of submissions to lessons
# User.students.each do |student|
#   Assignment.all.each do |a|
#     if [true, false].sample
#       s = Submission.create(content: Faker::HitchhikersGuideToTheGalaxy.quote, voice: Faker::VentureBros.organization)
#       student.student_lessons.create(submission: s, assignment: a, teacher: teacher)
#     end
#   end
# end

# # every student's submission, the teacher randomly grades
# User.students.each do |student|
#   student.student_lessons.submitted.each do |lesson|
#     if [true, false].sample
#       lesson.grading = Grading.create(content: Faker::WorldOfWarcraft.quote, voice: Faker::VentureBros.organization)
#       lesson.save
#     end
#   end
# end

#
leto = User.create(username: "Forrest", email: "letosleepingdragon@gmail.com", password: "student", open_id: "oSjX30DE9BEEvpe7SRhtaiiPyuiQ", is_teacher: false)
Lesson.create(assignment_id: 1, student_id: leto.id, teacher_id: teacher.id)
Lesson.create(assignment_id: 2, student_id: leto.id, teacher_id: teacher.id)
Lesson.create(assignment_id: 3, student_id: leto.id, teacher_id: teacher.id)
Lesson.create(assignment_id: 4, student_id: leto.id, teacher_id: teacher.id)
Lesson.create(assignment_id: 5, student_id: leto.id, teacher_id: teacher.id)
Lesson.create(assignment_id: 6, student_id: leto.id, teacher_id: teacher.id)
Lesson.create(assignment_id: 7, student_id: leto.id, teacher_id: teacher.id)
Lesson.create(assignment_id: 8, student_id: leto.id, teacher_id: teacher.id)
Lesson.create(assignment_id: 9, student_id: leto.id, teacher_id: teacher.id)
Lesson.create(assignment_id: 10, student_id: leto.id, teacher_id: teacher.id)
Lesson.create(assignment_id: 11, student_id: leto.id, teacher_id: teacher.id)
Lesson.create(assignment_id: 12, student_id: leto.id, teacher_id: teacher.id)
