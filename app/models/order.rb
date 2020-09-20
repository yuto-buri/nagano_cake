class Order < ApplicationRecord
	belongs_to :customer
	enum payment: {
		creditcard:0,
		transfer:1
	}
end
