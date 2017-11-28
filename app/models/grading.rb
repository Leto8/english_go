class Grading < ApplicationRecord
  belongs_to :lesson
  # belongs_to :users, through: :lessons

  validates :content, :presence true
  validates :voice, :presence true
end
