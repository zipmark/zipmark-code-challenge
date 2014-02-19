class CreateClearingHouses < ActiveRecord::Migration
  def change
    create_table :clearing_houses do |t|
      t.string :name
      t.string :routing_number
      t.string :record_type
      t.string :phone_number

      t.timestamps
    end
  end
end
