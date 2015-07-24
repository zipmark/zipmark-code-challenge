class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :routing_number #0's in fron need to be present the performance hit won't bite down the road can optimize with % "07" or something like that
      t.string :record_type
      t.string :name
      t.string :phone_number

      t.timestamps null: false
    end
  end
end
