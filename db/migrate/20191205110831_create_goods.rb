class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods, id: :integer do |t|
      t.integer    :user_id
      t.integer    :product_id
      t.timestamps
    end
    add_foreign_key :goods, :users
    add_foreign_key :goods, :products
  end
end
