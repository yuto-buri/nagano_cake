class Order < ApplicationRecord
	belongs_to :customer
	enum payment: {
		creditcard:0,
		transfer:1
	}

	enum status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]
	
	has_many :order_items, dependent: :destroy
	#中間テーブルを介して複数のプロダクトを持つ
	has_many :items, :through => :order_items
	#オーダーアイテムを複数追加するためのメソッド
	accepts_nested_attributes_for :order_items

	belongs_to :customer

	validates :addressee, presence: true,
	length: {maximum: 35, minimum: 2}
	validates :post_code, presence: true,
	length: {maximum: 10, minimum: 2}
	validates :send_to_address, presence: true,
	length: {maximum: 50, minimum: 3}
end
