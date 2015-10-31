class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.string :routing_number
      t.string :record_type
      t.string :phone_number
      t.references :address, index: true, foreign_key: true

      t.timestamps
    end
  end
end
