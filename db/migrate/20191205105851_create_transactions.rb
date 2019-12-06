class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions, id: :integer do |t|
      t.integer    :product_id
      t.integer    :user_id
      t.string     :status, null: false
      t.timestamps
    end
    add_foreign_key :transactions, :products
    add_foreign_key :transactions, :users
  end
end
