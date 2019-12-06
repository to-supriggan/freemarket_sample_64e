class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments, id: :integer do |t|
      t.string     :content, null: false
      t.integer    :user_id
      t.integer    :product_id
      t.timestamps
    end
    add_foreign_key :comments, :users
    add_foreign_key :comments, :products
  end
end
