class Assignment < ApplicationRecord
  has_one :lesson, required: false
  # has_many :users, through: :lesson

  validates :content, presence: true
  validates :voice, presence: true

  def self.submitted
    # return false if Lesson.where(submission_id: self.id).nil?
    Assignment.joins(:lessons).where(submission_id: self.id)
  end

  def self.graded
    Assignment.joins(:lessons).where(grading_id: self.id)
  end
end
