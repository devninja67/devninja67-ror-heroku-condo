class CreateCoownershipUnits < ActiveRecord::Migration[5.2]
  def change
    create_table :coownership_units do |t|
      t.string :uco
      t.string :tipo_unidad
      t.float :porcentaje_prorrateo

      t.timestamps
    end
  end
end
