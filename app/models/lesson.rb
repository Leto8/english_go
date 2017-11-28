class Lesson < ApplicationRecord
  has_many :assignments
  has_many :submissions
  has_many :gradings
  belongs_to :teacher, class_name: "User", foreign_key: :teacher_id
  belongs_to :student, class_name: "User", foreign_key: :student_id
end
