class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fav_items, through: :favorites, source: :item
  has_one :card
  has_one :address
  has_many :bought_items, foreign_key: 'buyer_id', class_name: 'Item'
  has_many :saling_items, ->{where("buyer_id is NULL")},foreign_key: 'saler_id', class_name: 'Item'
  has_many :sold_items, ->{where("buyer_id is not NULL")},foreign_key: 'saler_id', class_name: 'Item'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
