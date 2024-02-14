class Limit < ApplicationRecord
  validates :goal, presence:true
  belongs_to :user
end
