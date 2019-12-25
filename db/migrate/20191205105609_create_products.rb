class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products, id: :integer do |t|
      t.string     :name,                 null: false
      t.text       :information,          null: false
      t.string     :condition,            null: false
      t.string     :shipping_charge,      null: false
      t.string     :days_before_skipment, null: false
      t.integer    :price,                null: false
      t.integer    :user_id
      t.integer    :brand_id
      t.integer    :category_id
      t.string     :evaluation
      t.integer    :prefecture_id,        null: false
      t.timestamps
    end
    add_foreign_key :products, :users
    add_foreign_key :products, :brands
    add_foreign_key :products, :categories
  end
end
