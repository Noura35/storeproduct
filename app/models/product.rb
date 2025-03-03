class Product < ApplicationRecord

  has_one_attached :image


  belongs_to :category
  has_many :order_items,  dependent: :destroy
  has_many :shopping_cart_items, dependent: :destroy


  validates :name, presence: true
  validates :description, presence: true,length: {minimum:6}

end
