class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,                 null: false
      t.string     :information,          null: false
      t.string     :condition,            null: false
      t.string     :shipping_charge,      null: false
      t.string     :shipping_area,        null: false
      t.string     :days_before_skipment, null: false
      t.integer    :price,                null: false
      t.references :user,                 foreign_key: true
      t.references :brand,                foreign_key: true
      t.references :category,             foreign_key: true
      t.string     :evaluation,           null: false
      t.integer    :prefecture_id,        null: false
      t.timestamps
    end
  end
end
