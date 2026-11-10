class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users, id: :uuid, default: -> { "uuidv7()" } do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :password_digest, null: false

      t.boolean :active, null: false, default: true

      t.datetime :email_verified_at
      t.datetime :last_sign_in_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
