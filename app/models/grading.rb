class Grading < ApplicationRecord
  has_one :lesson, required: false
  # belongs_to :users, through: :lessons

  validates :content, presence: true
  validates :voice, presence: true
end
