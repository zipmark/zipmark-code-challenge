class Bank < ActiveRecord::Base

  def update_or_create!
    bank = Bank.find_by(routing_number: routing_number)
    if bank
      bank.update(attributes.except('id', 'created_at', 'updated_at'))
    else
      save
    end
  end
end
