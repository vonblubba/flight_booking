class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string  :first_name, null: false
      t.string  :last_name, null: false
      t.string  :email, null: false
      t.string  :password
      t.timestamps

      t.index :first_name
      t.index :last_name
      t.index :email
    end
  end
end
