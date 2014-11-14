class Bank < ActiveRecord::Base
  validates :routing_number, uniqueness: true
  validates :routing_number, length: { is: 9 }
  validates :name, :record_type, :street, :city, :state, :zip_code,  presence: true

  before_save :titleize_attrs


 def titleize_attrs
  self.city= city.titleize
 end

end
