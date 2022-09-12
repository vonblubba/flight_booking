class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.string  :identification_document_code, null: false
      t.integer :flight_execution_id, null: false
      t.integer :user_id, null: false
      t.string  :seat
      t.timestamps

      t.index :first_name
      t.index :last_name
      t.index :flight_execution_id
      t.index :user_id
    end
  end
end
