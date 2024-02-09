class Payment < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true
  validates :date, presence: true
end
