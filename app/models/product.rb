class Product < ApplicationRecord

  has_one_attached :image


  has_many :order_items,  dependent: :destroy
  has_many :shopping_cart_items, dependent: :destroy


  validates :name, presence: true

  belongs_to :category, optional: true
  belongs_to :subcategory, class_name: 'Category', optional: true
end
