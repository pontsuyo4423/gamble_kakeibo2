class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :birthday, presence: true
  has_many :incomes
  has_many :payments
end
