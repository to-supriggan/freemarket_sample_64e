# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|column|Type|Options|
|------|----|-------|
|nick_name|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: faise|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_year|string|null: false|
|birth_month|string|null: false|
|birth_day|string|null: false|
|phone_number|string|null: false, unique: true|
### Association
- has_many :products
- has_many :goods
- has_many :comments
- has_many :dealings
- has_many :addresses
- has_many :cards
- has_many :sns_credentials
## productsテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false|
|information|text|null: false|
|condition|string|null: false|
|shipping_charge|string|null: false| <!-- 送料の負担 --> 
|days_before_skipment|string|null: false| <!-- 発送までの日にち --> 
|price|integer|null:false|
|user_id|references|foreign_key: true| <!-- 売った人ID --> 
|brand_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|evaluation|string|null: false| <!-- 評価 -->
|prefecture_id|references|foreign_key: true|
### Association
- belongs_to :category
- has_many :comments
- has_many :images
- has_many :goods
- has_one :dealing
- belongs_to :user
- belongs_to :brand
- belongs_to :category
- belongs_to :prefecture
## goodsテーブル
|column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product
## categorysテーブル
|column|Type|Options|
|------|----|-------|
|genre|string||
|ancestry|string||
### Association
- has_many :products
## brandsテーブル
|column|Type|Options|
|------|----|-------|
|name|string|unique: true|
### Association
- has_many :products
## commentsテーブル
|column|Type|Options|
|------|----|-------|
|content|string|null: false|
|user_id|references|foreign_key: true|
|product_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :product
## imagesテーブル
|column|Type|Options|
|------|----|-------|
|image|string|null: false|
|product_id|references|foreign_key: true|
### Association
- belongs_to :product
## addressesテーブル
|column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postal_cord|string|null: false|
|prefecture_id|references|foreign_key: true|
|city|string|null: false|
|street_num|string|null: false|
|building|string|
|phone_num|string|
|user_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :prefecture
## dealingsテーブル
|column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key: true|
|user_id|references|foreign_key: true|<!-- 買った人ID -->
|status|string|null: false|<!-- 1:交渉中、2:購入済 -->
### Association
- belongs_to :product
- belongs_to :user
## cardsテーブル
|column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user
## sns_credentialsテーブル
|column|Type|Options|
|------|----|-------|
|provider|string||
|uid|string||
|user_id|references|foreign_key: true|
### Association
- belongs_to :user