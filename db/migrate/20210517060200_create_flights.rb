class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :from_city_code, null: false
      t.string :to_city_code, null: false
      t.string :flight_code
      t.timestamps

      t.index :from_city_code
      t.index :to_city_code
      t.index :flight_code
      t.index [:from_city_code, :to_city_code], unique: true
    end
  end
end
