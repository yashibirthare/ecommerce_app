class Category < ApplicationRecord
	has_and_belongs_to_many :products

	scope :main_c, -> { where(category_id: nil) }
	
	has_many :sub_categories, class_name: 'Category'
    belongs_to :category, foreign_key: 'category_id', optional: true
end
