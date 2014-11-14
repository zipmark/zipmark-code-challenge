class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.string :routing_number
      t.string :record_type
      t.string :street
      t.string :street_optional
      t.string :city
      t.string :state
      t.string :zip_code
      t.timestamps
    end
  end
end
