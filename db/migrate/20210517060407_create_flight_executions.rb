class CreateFlightExecutions < ActiveRecord::Migration[6.1]
  def change
    create_table :flight_executions do |t|
      t.string   :flight_execution_code, null: false
      t.integer  :flight_id, null: false
      t.integer  :airplane_id, null: false
      t.datetime :flight_execution_time, null: false
      t.timestamps

      t.index :flight_execution_code
      t.index :flight_id
      t.index :airplane_id
      t.index :flight_execution_time
    end
  end
end
