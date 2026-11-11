class CreateSessions < ActiveRecord::Migration[8.1]
  def change
    create_table :sessions, id: :uuid, default: -> { "uuidv7()" } do |t|
      t.string :token, null: false
      t.string :ip_address
      t.string :user_agent

      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :sessions, :token, unique: true
  end
end
