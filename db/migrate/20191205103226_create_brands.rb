class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands, id: :integer do |t|
      t.string :name, unique: true
      t.timestamps
    end
  end
end
