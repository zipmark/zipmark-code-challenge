class Bank < ActiveRecord::Base
  validates :routing_number, uniqueness: true
  validates :routing_number, length: { is: 9 }

end
