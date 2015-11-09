class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.integer :routing_number
      t.string :record_type
      t.string :phone_number
      t.string :street
      t.string :street_2
      t.string :city
      t.string :state
      t.integer :zip_code

      t.timestamps null: false
    end
  end
end
