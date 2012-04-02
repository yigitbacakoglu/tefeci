class AddTokenSecretToUser < ActiveRecord::Migration
  def change
    add_column :users, :token_secret, :string

  end
end
