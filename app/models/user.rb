class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fav_items, through: :favorites, source: :item
  has_one :card
  has_one :address
  has_many :bought_items, foreign_key: 'buyer_id', class_name: 'Item'
  has_many :saling_items, ->{where("buyer_id is NULL")},foreign_key: 'saler_id', class_name: 'Item'
  has_many :sold_items, ->{where("buyer_id is not NULL")},foreign_key: 'saler_id', class_name: 'Item'
  has_many :comments

  validates :nickname, :last_name, :first_name, :last_name_furigana, :first_name_furigana, :birthday, presence: true
  validates :last_name, :first_name, format: { with: /\A[ぁ-んァ-ヶー一-龠]+\z/}
  validates :last_name_furigana, :first_name_furigana, format: { with: /\A[あ-ん゛゜ぁ-ぉゃ-ょー]+\z/}
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_secure_password
end