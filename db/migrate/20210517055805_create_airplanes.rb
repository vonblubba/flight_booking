class CreateAirplanes < ActiveRecord::Migration[6.1]
  def change
    create_table :airplanes do |t|
      t.string :airplane_code, null: false
      t.string :description
      t.timestamps

      t.index :airplane_code
    end
  end
end
