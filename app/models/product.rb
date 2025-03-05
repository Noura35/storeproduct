class Product < ApplicationRecord
  belongs_to :subcategory
  has_one :category, through: :subcategory
  has_one_attached :image
  
  
end
