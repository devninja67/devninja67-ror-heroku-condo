class CreateCommunities < ActiveRecord::Migration[5.2]
  def change
    create_table :communities do |t|
      t.string :nombre
      t.string :ciudad
      t.string :comuna
      t.string :region
      t.string :pais
      t.string :direccion
      t.integer :telefono1
      t.integer :telefono2
      t.string :imagen
      t.string :logo
      t.string :rut
      t.date :fecha_constitution
      t.string :email

      t.timestamps
    end
  end
end
