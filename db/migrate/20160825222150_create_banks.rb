class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.integer :routing_num, null:false
      t.string :office_code
      t.integer :frb_num
      t.integer :record_type_code
      t.datetime :last_change_date
      t.integer :new_routing_num
      t.text :cust_name
      t.text :address
      t.text :city
      t.integer :state_code
      t.integer :zipcode
      t.integer :zipcode_ext
      t.integer :tel_area_code
      t.integer :tel_prefix
      t.integer :tel_suffix
      t.integer :inst_status__code
      t.integer :data_view_code

      t.timestamps null: false
    end
  end
end
