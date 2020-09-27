class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
    def active_for_authentication?
    	super && (self.is_deleted == false)
	end
  validates :last_name, presence: true,
  length: {maximum: 20}
  validates :first_name, presence: true,
  length: {maximum: 20}
  validates :postal_code, presence: true,
  length: {is: 7}
  validates :address, presence: true,
  length: {maximum: 50}
  validates :telephone_number, presence: true,
  length: {maximum: 15}
  def address_posted?(address)
    self.addresses.where(name: address.name, postal_code: address.postal_code, delivery: address.delivery).exists?
  end
end