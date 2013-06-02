class Item < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category
  belongs_to :color
  belongs_to :dress_size
end