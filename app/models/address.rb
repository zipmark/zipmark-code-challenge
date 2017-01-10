class Address < ActiveRecord::Base
  belongs_to :addressable, polymorphic: true

  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }
  validates :state, length: { is: 2 }
end
