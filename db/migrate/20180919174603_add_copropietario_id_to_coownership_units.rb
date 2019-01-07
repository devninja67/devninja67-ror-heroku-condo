class AddCopropietarioIdToCoownershipUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :coownership_units, :copropietario_id, :string
    add_index :coownership_units, :copropietario_id
  end
end
