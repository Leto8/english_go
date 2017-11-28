class Submission < ApplicationRecord
  has_one :lesson, required: false

  validates :content, presence: true
  validates :voice, presence: true
end
