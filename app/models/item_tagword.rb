class ItemTagword < ApplicationRecord
  belongs_to :item
  belongs_to :tagword
end
