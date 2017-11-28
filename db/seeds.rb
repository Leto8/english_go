# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Assignment.delete_all
Submission.delete_all
Grading.delete_all

require 'faker'

10.times do
  teacher = User.create!(username: Faker::LeagueOfLegends.unique.champion, email: Faker::Internet.email, phone_number: Faker::Number.number(10), password: "fuckyou")
  student = User.create!(username: Faker::HarryPotter.unique.character, email: Faker::Internet.email, phone_number: Faker::Number.number(10), password: "fuckyou")
  a = Assignment.create!(content: Faker::VentureBros.quote, voice: Faker::VentureBros.organization)
  b = Submission.create!(content: Faker::HitchhikersGuideToTheGalaxy.quote, voice: Faker::StarWars.quote)
  c = Grading.create!(content: Faker::WorldOfWarcraft.quote, voice: Faker::HarryPotter.quote)
  teacher.teaching_lessons.create!(assignment: a, submission: b, grading: c, student: student)
end

puts "$&@^ing %&*&@ $*!@"
