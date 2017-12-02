class User < ApplicationRecord
  # acts_as_token_authenticatable

  has_many :teaching_lessons, class_name: "Lesson", foreign_key: "teacher_id"
  has_many :student_lessons, class_name: "Lesson", foreign_key: "student_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def is_teacher?
    @user.teacher_id
  end

  def student?
    @user.student_id
  end

  def lessons
    Lesson.where(student_id: self.id)
  end
end
