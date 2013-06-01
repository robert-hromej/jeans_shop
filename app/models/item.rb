class Item < ActiveRecord::Base
  has_many :carts
  belongs_to :brand
  belongs_to :category
end
