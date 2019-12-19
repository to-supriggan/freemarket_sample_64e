class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses, id: :integer do |t|
      t.string     :last_name,       null: false
      t.string     :first_name,      null: false
      t.string     :last_name_kana,  null: false
      t.string     :first_name_kana, null: false
      t.string     :postal_cord,     null: false
      t.integer    :prefecture_id,   null: false
      t.string     :city,            null: false
      t.string     :street_num,      null: false
      t.string     :building
      t.string     :phone_num
      t.integer    :user_id,         null: false
      t.timestamps
    end
    add_foreign_key :adresses, :users
  end
end
