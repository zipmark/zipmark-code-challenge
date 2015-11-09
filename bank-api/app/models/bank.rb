class Bank < ActiveRecord::Base

  def update_or_create!
    bank_persisted = Bank.find_by(routing_number: routing_number)
    if bank_persisted
      self.updated_at = Time.now
      bank_persisted.update(self.attributes.except('id', 'created_at'))
    else
      self.save
    end
  end
end
