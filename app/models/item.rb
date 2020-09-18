class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
	belongs_to :genre
	attachment :image
	enum is_active: [:販売中, :販売停止中]
end
