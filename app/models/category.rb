class Category < ApplicationRecord
    validates :name, presence: true



    has_many :subcategories, class_name: 'Category', foreign_key: 'parent_id'
    belongs_to :parent, class_name: 'Category', optional: true
    has_many :products

end
