class CreateAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :adresses do |t|
      t.string     :postal_cord,   null: false
      t.string     :city,          null: false
      t.string     :street_num,    null: false
      t.string     :building
      t.references :user,          null: false, foreign_key: true
      t.integer    :prefecture_id, null: false
      t.timestamps
    end
  end
end