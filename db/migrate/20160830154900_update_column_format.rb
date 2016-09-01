class UpdateColumnFormat < ActiveRecord::Migration
  def change
    add_column :banks, :tel_number, :string
    add_column :banks, :street_address, :string
    add_column :banks, :state, :string
    remove_column :banks, :address, :string
    remove_column :banks, :state_code, :string
    remove_column :banks, :tel_area_code, :string
    remove_column :banks, :tel_prefix, :string
    remove_column :banks, :tel_suffix, :string
    change_column :banks, :last_change_date, :string
  end
end
