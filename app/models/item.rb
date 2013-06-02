class Item < ActiveRecord::Base
  has_many :carts
  belongs_to :brand
  belongs_to :category
  belongs_to :dress_size
  belongs_to :color
end
