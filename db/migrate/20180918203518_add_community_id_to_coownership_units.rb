class AddCommunityIdToCoownershipUnits < ActiveRecord::Migration[5.2]
  def change
    add_reference :coownership_units, :community, foreign_key: true
  end
end
