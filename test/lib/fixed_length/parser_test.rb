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
    unpack_format = FixedLength::Parser.new(@ach_format).send :unpack_format
    assert_equal "a9a1*", unpack_format
  end

  test "unpack format with types specified" do
    unpack_format = FixedLength::Parser.new(@ach_format_with_types).send :unpack_format

    assert_equal "M9a1*", unpack_format
  end

  test "unpack format raises exception if no length given" do
    assert_raises do
      FixedLength::Parser.new(routing_number: { type: 'A' }).send :unpack_format
    end
  end

  test "parse" do
    parsed_output = FixedLength::Parser.new(@ach_format).parse(@bank_file)

    fed = banks(:one)
    quincy = banks(:two)

    assert_kind_of Array, parsed_output
    assert_equal fed.routing_number, parsed_output.first.first
    assert_equal quincy.routing_number, parsed_output.last.first
  end
end
