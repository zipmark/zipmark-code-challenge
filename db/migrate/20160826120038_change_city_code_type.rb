class ChangeCityCodeType < ActiveRecord::Migration
  def change
    change_column :banks, :state_code, :string
  end
end
