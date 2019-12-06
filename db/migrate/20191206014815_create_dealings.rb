class CreateDealings < ActiveRecord::Migration[5.2]
  def change
    create_table :dealings, id: :integer  do |t|
      t.integer    :product_id
      t.integer    :user_id
      t.string     :status, null: false
      t.timestamps
    end
    add_foreign_key :dealings, :products
    add_foreign_key :dealings, :users
  end
end
