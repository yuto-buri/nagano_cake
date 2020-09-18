class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
	belongs_to :genre
	attachment :image
	enum is_active: [:販売可, :販売不可]
end
