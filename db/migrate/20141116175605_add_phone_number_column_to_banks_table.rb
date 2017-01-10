class AddPhoneNumberColumnToBanksTable < ActiveRecord::Migration
  def change
    add_column :banks, :phone_number, :string
  end
end
