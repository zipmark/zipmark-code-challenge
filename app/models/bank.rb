class Bank < ActiveRecord::Base
  validates :routing_num, presence: true

end
