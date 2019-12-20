class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards , id: :integer do |t|
      t.integer :user_id, null: false
      t.string :customer_id, null: false
      t.string :card_id, null: false
      t.timestamps
    end
    add_foreign_key :cards, :users
  end
end