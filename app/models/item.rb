class Item < ApplicationRecord
  validates :name, presence: true, length: {minimum: 2}
  validates :brand, presence: true, length: {minimum: 2}
  validates :description, presence: true, length: {minimum: 20}
  validates :returnable, presence: true
  validates :price, presence: true
  has_one_attached :image
  has_many :item_tagwords, dependent: :destroy
  has_many :tagwords, through: :item_tagwords
  

  belongs_to :bucket
end
