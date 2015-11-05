require 'test_helper'

class FedacheTest < ActiveSupport::TestCase
  include FaradayMiddlewareSetup
  include LoadBankFixture

  def setup
    super

    @response = process(@bank_file)
  end

  test "parses fedach correctly" do
    assert_kind_of Array, @response.body
  end

  test "first record routing number matches fixture" do
    assert_equal banks(:one).routing_number, @response.body.first[:routing_number]
  end

  test "first record's address matches fixture" do
    assert_equal banks(:one).address.state, @response.body.first[:state]
  end

  test "second record routing number matches fixture" do
    assert_equal banks(:two).routing_number, @response.body.second[:routing_number]
  end

  test "second record's address matches fixture" do
    assert_equal banks(:two).address.state, @response.body.second[:state]
  end
end
