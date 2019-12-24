class CreateSnsCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :sns_credentials do |t|
      t.string :provider
      t.string :uid
      t.integer :user_id
      t.timestamps
    end
    add_foreign_key :sns_credentials, :users
  end
end
