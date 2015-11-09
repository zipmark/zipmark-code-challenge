class ChangeBankZipCodeTypeToString < ActiveRecord::Migration
  def change
    change_column :banks, :zip_code, :string
  end
end
