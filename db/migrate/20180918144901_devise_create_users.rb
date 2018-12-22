# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      #Custom fields
      t.string :nombres
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :rut
      t.integer :telefono
      t.string :direccion
      t.string :region
      t.string :ciudad
      t.string :comuna
      t.string :pais
      t.string :nombre_usuario
      #Pondé todos estos campos para ver cual me servirá para los permisos
      t.string :nivel_de_permiso
      t.integer :es_administrador
      t.integer :es_propietario
      t.integer :es_residente
      t.integer :es_site_admin

      #tipo debería decir si es conserje, aseo, residente, administrdor o algo así


      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
