class User < ApplicationRecord
  # acts_as_token_authenticatable
  has_many :teaching_lessons, class_name: "Lesson", foreign_key: "teacher_id"
  has_many :student_lessons, class_name: "Lesson", foreign_key: "student_id"
  has_many :student_assignments, through: :student_lessons, source: "assignment"
  has_many :teacher_assignments, through: :teacher_lessons, source: "assignment"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def is_teacher?
    return false if Lesson.where(teacher_id: self.id).nil?
    Lesson.where(teacher_id: self.id).pluck(:teacher_id)
  end

  def is_student?
    return false if Lesson.where(student_id: self.id).nil?
    Lesson.where(student_id: self.id).pluck(:student_id)
  end

  # def lessons
  #   Lesson.where(student_id: self.id)
  # end
end
