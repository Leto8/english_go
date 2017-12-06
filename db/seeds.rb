# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

# # use db:reset instead!

require 'faker'

# 12 assignments
12.times do
  Assignment.create(content: Faker::HarryPotter.quote, voice: Faker::VentureBros.organization)
end

# 1 teacher
teacher = User.create(username: Faker::LeagueOfLegends.unique.champion, email: Faker::Internet.email, password: "fuckyou", is_teacher: true)

# 10 students
10.times do
  User.create(username: Faker::LeagueOfLegends.unique.champion, email: Faker::Internet.email, password: "fuckyou", is_teacher: false)
end

# lessons per student
# every students have random number of submissions to lessons
User.students.each do |student|
  Assignment.all.each do |a|
    if [true, false].sample
      s = Submission.create(content: Faker::HitchhikersGuideToTheGalaxy.quote, voice: Faker::VentureBros.organization)
      student.student_lessons.create(submission: s, assignment: a, teacher: teacher)
    end
  end
end

# every student's submission, the teacher randomly grades
User.students.each do |student|
  student.student_lessons.submitted.each do |lesson|
    if [true, false].sample
      lesson.grading = Grading.create(content: Faker::WorldOfWarcraft.quote, voice: Faker::VentureBros.organization)
      lesson.save
    end
  end
end
