class Tagword < ApplicationRecord
  has_many :item_tagwords, dependent: :destroy
  has_many :items, through: :item_tagwords
end
