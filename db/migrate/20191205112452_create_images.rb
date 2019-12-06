class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images, id: :integer do |t|
      t.string     :image, null: false
      t.integer    :product_id
      t.timestamps
    end
    add_foreign_key :images, :products
  end
end
