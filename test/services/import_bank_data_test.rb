require 'test_helper'

class ImportBankDataTest < ActiveSupport::TestCase
  test "connection is an instance of Faraday::Connection" do
    assert_kind_of Faraday::Connection, ImportBankData.connection
  end

  test "response_body contains the decoded response" do
    data = ImportBankData.response_body
    assert_kind_of Array, data
    refute_empty data
  end
end
