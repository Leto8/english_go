class User < ApplicationRecord
  acts_as_token_authenticatable

  has_many :teaching_lessons, class_name: "Lesson", foreign_key: "teacher_id"
  has_many :student_lessons, class_name: "Lesson", foreign_key: "student_id"
  has_many :student_assignments, through: :student_lessons, source: "assignment"
  has_many :teacher_assignments, through: :teacher_lessons, source: "assignment"
  has_many :submissions, through: :student_lessons, source: "submission"
  has_many :gradings, through: :student_lessons, source: "grading"

  has_many :students, through: :teaching_lessons, source: "student"


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # :confirmable, :lockable, :timeoutable and :omniauthable


  scope :students, -> { where(is_teacher: false) }
  scope :teachers, -> { where(is_teacher: true) }


  def is_student?
    !is_teacher
  end

end
