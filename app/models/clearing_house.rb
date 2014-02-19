class ClearingHouse < ActiveRecord::Base
  validates :routing_number, uniqueness: true
  has_one :address
end
