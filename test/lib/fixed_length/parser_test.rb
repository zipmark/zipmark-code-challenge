require 'test_helper'

class ParserTest < ActiveSupport::TestCase
  prepend LoadBankFixture

  def setup
    @ach_format = {
      routing_number: { length: 9 },
      something: { length: 1 }
    }

    @ach_format_with_types = @ach_format.deep_dup
    @ach_format_with_types[:routing_number][:type] = 'M'
    @ach_format_with_types[:something][:type] = 'a'
  end

  test "unpack format without types specified" do
    unpack_format = FixedLength::Parser.new(@ach_format, nil).send :unpack_format
    assert_equal "a9a1*", unpack_format
  end

  test "unpack format with types specified" do
    unpack_format = FixedLength::Parser.new(@ach_format_with_types, nil).send :unpack_format

    assert_equal "M9a1*", unpack_format
  end

  test "unpack format raises exception if no length given" do
    assert_raises do
      format = { routing_number: { type: 'A' } }
      FixedLength::Parser.new(format, nil).send :unpack_format
    end
  end

  test "unpacked_body parses into correct array format" do
    parsed_output = FixedLength::Parser.new(@ach_format, @bank_file).send :unpacked_body

    fed = banks(:one)
    quincy = banks(:two)

    assert_kind_of Array, parsed_output
    assert_equal fed.routing_number, parsed_output.first.first
    assert_equal quincy.routing_number, parsed_output.last.first
  end

  test "zip to hash creates a hash with keys" do
    parser = FixedLength::Parser.new(@ach_format, @bank_file)

    unpacked_body = parser.send :unpacked_body
    zipped = parser.send :zip, unpacked_body

    assert_kind_of Array, zipped
    assert_kind_of Hash, zipped.first
  end

  test "parse method returns an array of hashes" do
    parsed_output = FixedLength::Parser.new(@ach_format, @bank_file).parse

    assert_kind_of Array, parsed_output
    assert_kind_of Hash, parsed_output.first
  end

  test "parse includes keys" do
    parsed_output = FixedLength::Parser.new(@ach_format, @bank_file).parse

    fed = banks(:one)
    quincy = banks(:two)

    assert_kind_of Array, parsed_output
    assert_equal fed.routing_number, parsed_output.first[:routing_number]
    assert_equal quincy.routing_number, parsed_output.last[:routing_number]
  end
end
