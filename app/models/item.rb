class Item < ApplicationRecord
  belongs_to :saler, class_name: 'User'
  belongs_to :buyer, class_name: 'User', optional: true
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
  belongs_to :condition
  belongs_to :shipping_date
  belongs_to :postage
  belongs_to :category
  belongs_to :brand
  has_many :item_images, dependent: :destroy
end
