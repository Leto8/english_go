class Submission < ApplicationRecord
  belongs_to :lesson, required: false

  validates :content, presence: true
  validates :voice, presence: true
end
