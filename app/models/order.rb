class Order < ApplicationRecord
	belongs_to :customer
	enum payment: {creditcard: 0, transfer: 1}

	enum status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4}

	has_many :order_details, dependent: :destroy
	#中間テーブルを介して複数のプロダクトを持つ
	has_many :items, :through => :order_items
	#オーダーアイテムを複数追加するためのメソッド
	#accepts_nested_attributes_for :order_items

	validates :address, presence: true,
	length: {maximum: 35, minimum: 2}
	validates :postal_code, presence: true,
	length: {maximum: 10, minimum: 2}

end

