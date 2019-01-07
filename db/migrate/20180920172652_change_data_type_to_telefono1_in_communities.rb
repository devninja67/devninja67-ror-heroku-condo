class ChangeDataTypeToTelefono1InCommunities < ActiveRecord::Migration[5.2]
  def change
  	change_column(:communities, :telefono1, :string)
  end
end
