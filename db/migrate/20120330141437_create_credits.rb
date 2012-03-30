class CreateCredits < ActiveRecord::Migration
  def change
    create_table :credits do |t|
      t.integer :friend_id
      t.decimal :miktar
      t.string :durum
      t.datetime :ver_tarih
      t.datetime :vade_tarih

      t.timestamps
    end
  end
end
