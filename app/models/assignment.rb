class Assignment < ApplicationRecord
  belongs_to :lesson, required: false
  # has_many :users, through: :lesson

  validates :content, presence: true
  validates :voice, presence: true
end
