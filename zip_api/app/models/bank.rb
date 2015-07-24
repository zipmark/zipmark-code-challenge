class Bank < ActiveRecord::Base
  has_one :address

  #remove timestamps here
  def json_address
    { street: self.address.street,
      street_2: self.address.street_2,
      city: self.address.city,
      state: self.address.state,
      zip:   self.address.zip
    }
  end

  #working with the presenter above call control which fields need to be revealed to the api
  #removing meta data like internal id's and time stamps

  def public_json
      bank_hash = self.as_json(:methods => [:json_address], :except => [:created_at, :updated_at, :id]) 
      bank_hash['address'] = bank_hash['json_address']
      bank_hash.reject {|x| x == 'json_address'} #to remove the rails extras from the output 
  end
end
