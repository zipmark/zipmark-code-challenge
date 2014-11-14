class AddUpdatedRoutingColumnToBanksTable < ActiveRecord::Migration
  def change
    add_column :banks, :updated_routing_number, :string
  end
end
