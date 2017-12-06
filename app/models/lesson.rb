class Lesson < ApplicationRecord
  belongs_to :assignment
  belongs_to :submission, required: false
  belongs_to :grading, required: false
  belongs_to :teacher, class_name: "User", foreign_key: :teacher_id
  belongs_to :student, class_name: "User", foreign_key: :student_id


  # return an array via scope
  scope :submitted,  -> { where.not(submission: nil) }
  scope :graded,  -> { where.not(grading: nil) }

end
