class ChangeBankRoutingNumberTypeToString < ActiveRecord::Migration
  def change
    change_column :banks, :routing_number, :string
  end
end
