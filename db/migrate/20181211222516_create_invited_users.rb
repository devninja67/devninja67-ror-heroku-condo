class CreateInvitedUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :invited_users do |t|

      t.timestamps
    end
  end
end
