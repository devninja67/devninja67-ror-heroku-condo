class AddResidenteIdToCoownershipUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :coownership_units, :residente_id, :string
    add_index :coownership_units, :residente_id
  end
end
