class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.string :routing_number, index: true
      t.string :phone_number

      t.timestamps
    end
  end
end
