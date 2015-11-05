require 'test_helper'

class ColumnTest < ActiveSupport::TestCase
  def setup
    @class_with_column_module = Class.new.tap do |klass|
      klass.send :extend, FixedLength::Column
    end
  end

  test "adds columns accessor" do
    assert_respond_to @class_with_column_module, :columns
  end

  test "columns is defaulted to hash" do
    assert_kind_of Hash, @class_with_column_module.columns
  end

  test "column method adds to columns hash" do
    assert_difference(-> { @class_with_column_module.columns.keys.size }, 1) do
      @class_with_column_module.column :hello, nil
    end
  end

  test "column method adds options" do
    @class_with_column_module.column :hello, length: 9
    assert_kind_of Hash, @class_with_column_module.columns[:hello]
  end
end
