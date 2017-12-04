class Assignment < ApplicationRecord
  has_one :lesson, required: false
  # has_many :users, through: :lesson

  validates :content, presence: true
  validates :voice, presence: true

  def self.submitted
    # return false if Lesson.where(submission_id: self.id).nil?
    Assignment.joins(:lessons).where(submission_id: self.id)
  end

   # def graded
  #   return false if Lesson.where(grading_id: self.id).nil?
  #   y = Lesson.where(grading_id: self.id).pluck(:assignment_id)
  #   Assignment.where(id: y)
  # end
end
