class Submission < ApplicationRecord
  has_one :lesson, required: false
  validates :voice, presence: true
end
