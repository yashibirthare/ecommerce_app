class Cart < ApplicationRecord
	belongs_to :user
	has_many :cart_items, :dependent => :destroy
	has_many :products, through: :cart_items
	accepts_nested_attributes_for :cart_items, allow_destroy: true
end
