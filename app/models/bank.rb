class Bank < ActiveRecord::Base
  validates :routing_num, presence: true

  def record_type
    types = [
      "Federal Reserve Bank",
      "Send items to customer routing number",
      "Send items to customer using new routing number field"
      ]
    types[self.record_type_code]
  end

end
