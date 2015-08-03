class Bank < ActiveRecord::Base
  validates :routing_number, uniqueness: true
end
