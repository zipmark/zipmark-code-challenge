class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip_code

      t.timestamps
    end
  end
end
