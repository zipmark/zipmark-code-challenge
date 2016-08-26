class ChangeIntConversion < ActiveRecord::Migration
  def change
    change_column :banks, :routing_num, :string
    change_column :banks, :new_routing_num, :string
    change_column :banks, :tel_area_code, :string
    change_column :banks, :tel_prefix, :string
    change_column :banks, :tel_suffix, :string
    change_column :banks, :zipcode, :string
    change_column :banks, :zipcode_ext, :string
  end
end
