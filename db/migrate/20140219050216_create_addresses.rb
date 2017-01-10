class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip_code
      t.references :clearing_house, index: true

      t.timestamps
    end
  end
end
