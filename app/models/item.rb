class Item < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2}
  validates :brand, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 20}
  validates :returnable, presence: true
  validates :price, presence: true

  belongs_to :bucket
end
