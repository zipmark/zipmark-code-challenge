require 'rails_helper'

RSpec.describe Bank, :type => :model do
  it { should validate_uniqueness_of(:routing_number) }
end
