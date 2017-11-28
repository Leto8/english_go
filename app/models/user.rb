class User < ApplicationRecord
  acts_as_token_authenticatable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :teaching_lessons, class_name: "Lesson", foreign_key: "teacher_id"
  has_many :student_lessons, class_name: "Lesson", foreign_key: "student_id"
end
