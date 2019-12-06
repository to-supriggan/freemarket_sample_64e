class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses, id: :integer do |t|
      t.string     :postal_cord,   null: false
      t.string     :city,          null: false
      t.string     :street_num,    null: false
      t.string     :building
      t.integer    :user_id,       null: false
      t.integer    :prefecture_id, null: false
      t.timestamps
    end
    add_foreign_key :adresses, :users
  end
end
