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
|name|string|null: false|<!-- ok -->
|kana_name|string|null: faise|<!-- ok -->
|nick_name|string|null: false|<!-- ok -->
|email|string|unique: true|<!-- ?null: false? -->
|password|string|unique: true|<!-- ok -->
|birthday|string|null: false|<!-- ok -->
|address|string|null: false|<!-- ok -->
|payment_method|string|null: false| <!-- ok -->
|created_at|timestamps|null: false|<!-- ok -->
|updates_at|timestamps|null: false|<!-- ok -->
### Association
- has_many :products
- has_many :goods
- has_many :comments
- belongs_to :transaction
## productsテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false| <!-- ok -->
|information|string|null: false| <!-- ok -->
|condition|string|null: false| <!-- ok -->
|image|string|null: false| <!-- ok -->
|shipping_charge|string|null: false| <!-- 送料の負担 --> <!-- ok -->
|shipping_area|string|null: false| <!-- 発送元地域 --> <!-- ok -->
|days_before_skipment|string|null: false| <!-- 発送までの日にち --> <!-- ok -->
|price|integer|null:false| <!-- ok -->
|buyer_id|references|foreign_key: true| <!-- 売った人ID --> <!-- ok -->
|brand_id|references|foreign_key: true|<!-- ?brandテーブルから持ってくる書き方? -->
|category_id|references|foreign_key: true|<!-- ?categoryテーブルから持ってくる書き方? -->
|Evaluation|string|null: false|  <!-- 評価 -->
|created_at|timestamps|null: false|<!-- ok -->
|updates_at|timestamps|null: false|<!-- ok -->
### Association
- has_many :comments
- has_many :images
- has_many :goods
- belongs_to :user
- belongs_to :transaction
- belongs_to :brand
- belongs_to :category
## transactionsテーブル
|column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key: true|<!-- ?productテーブルから持ってくる書き方? -->
|exhibitor_id|references|foreign_key: true| <!-- 買った人ID --> <!-- ok -->
|comments|string|<!-- ok -->
|status|string|null: false|<!-- 販売進捗 --> <!-- ok -->
|created_at|timestamps|null: false|<!-- ok -->
|updates_at|timestamps|null: false|<!-- ok -->
### Association
- belongs_to :user
- belongs_to :product
## goodsテーブル
|column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|<!-- ok -->
|product_id|references|foreign_key: true|<!-- ok -->
### Association
- belongs_to :user
- belongs_to :product
## categorysテーブル
|column|Type|Options|
|------|----|-------|
|genre|string|null: false|<!-- ok -->
|brand_id|references|foreign_key: true|<!-- ok -->
### Association
- has_many :products
## brandsテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false|<!-- ok -->
### Association
- has_many :products
## commentsテーブル
|column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|<!-- ok -->
|product_id|references|foreign_key: true|<!-- ok -->
|content|string|null: false|<!-- ok -->
|created_at|timestamps|null: false|<!-- ok -->
### Association
- belongs_to :user
- belongs_to :product
## imagesテーブル
|column|Type|Options|
|------|----|-------|
|image|string|null: false|<!-- ok -->
|product_id|references|foreign_key: true|<!-- ok -->
### Association
- belongs_to :product
<!-- buyer = 売り -->
