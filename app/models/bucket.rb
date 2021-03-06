class Bucket < ApplicationRecord
  validates :name, presence: true, length: {minimum: 4}
  validates :description, presence: true, length: {minimum: 10}

  belongs_to :user
  has_many :items, dependent: :destroy

  
end
