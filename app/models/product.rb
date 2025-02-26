class Product < ApplicationRecord
  belongs_to :category
  has_many :order_items,  dependent: :destroy


  validates :name, presence: true
  validates :description, presence: true,length: {minimum:6}

end
