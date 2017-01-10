class Bank < ActiveRecord::Base
  has_one :address, as: :addressable, autosave: true, dependent: :destroy

  validates :routing_number, numericality: { only_integer: true }, length: { is: 9 }
  validates :address, presence: true

  accepts_nested_attributes_for :address
end
