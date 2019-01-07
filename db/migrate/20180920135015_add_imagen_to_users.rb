class AddImagenToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :imagen, :string
  end
end
