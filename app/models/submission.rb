class Submission < ApplicationRecord
  belongs_to :lesson

  validates :content, presence: true
  validates :voice, presence: true
end
