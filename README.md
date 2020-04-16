# DB設計

## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|text|null: false|
|discription|text|null: false|
|price|integer|null: false|
|saler_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|postage_id|integer|null: false, foreign_key: true|
|shipping_date_id|integer|null: false, foreign_key: true|
|condition_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- has_many :favorites
- has_many :users, through: :favorites
- belongs_to :prefecture
- belongs_to :condition
- belongs_to :shipping_date
- belongs_to :postage
- belongs_to :category
- belongs_to :brand
- has_many :item_images


## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|text|null: false , unique: true|
|email|text|null: false , unique: true|
|password|string|null: false|
|last_name|text|null: false|
|first_name|text|null: false|
|last_name_furigana|text|null: false|
|first_name_furigana|text|null: false|
|birthday|date|null: false|
|tel|integer||

### Association
- has_many :items
- has_many :favorites
- has_many :fav_items, through: :favorites, source: :item
- has_one :card
- has_one :address
- has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
- has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
- has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"


## Favoritesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## Addressesテーブル

|Column|Type|Options|
|------|----|-------|
|zipcode|integer(7)|null: false|
|prefecture_name|text|null: false|
|city|text|null: false|
|street|text|null: false|
|building|text||
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :items
- belongs_to :user


## Prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|prefecture|text||

### Association
- has_many :items


## Cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user


## Item_imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :item


## Brandsテーブル

|Column|Type|Options|
|------|----|-------|
|brand|text||

### Association
- has_many :items


## Categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|category|text||
|ancestry|string|null: false|

### Association
- has_many :items
- has_ancestry


## Postagesテーブル

|Column|Type|Options|
|------|----|-------|
|payer|text||

### Association
- has_many :items


## Shipping_datesテーブル

|Column|Type|Options|
|------|----|-------|
|date|text||

### Association
- has_many :items


## Conditionsテーブル

|Column|Type|Options|
|------|----|-------|
|condition|text||

### Association
- has_many :items