class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :bank_id
      t.string :street
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps null: false
    end
  end
end
