class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
  end
end
