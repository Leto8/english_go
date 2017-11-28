class Assignment < ApplicationRecord
  belongs_to :lesson
  # has_many :users, through: :lesson

  validates :content, presence: true
  validates :voice, presence: true
end
