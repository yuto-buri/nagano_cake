class Genre < ApplicationRecord
	validates :name, presence: true
	has_many :items

	after_update do
		if (is_active) == false
			self.items.each {|item|
				item.update(is_active: "販売不可")
			}
		end
	end
end
