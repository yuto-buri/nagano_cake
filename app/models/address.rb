class Address < ApplicationRecord
	belongs_to :customer
	def full_address
		"#{postal_code} #{delivery} #{name}"
	end
end
