class Assignment < ApplicationRecord
  has_one :lesson, required: false
  # has_many :users, through: :lesson

  validates :content, presence: true
  validates :voice, presence: true
end
