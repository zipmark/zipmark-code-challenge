module FixedLength
  class Parser
    attr_reader :columns

    def initialize(columns)
      @columns = columns
    end

    def parse(body)
      body.lines.map do |line|
        line.unpack(unpack_format)
      end
    end

    private

    def unpack_format
      @unpack_format ||= build_unpack_format.join + "*"
    end

    def build_unpack_format
      columns.map do |_, options|
        type = options.fetch(:type, 'a')
        length = options.fetch(:length)

        "#{type}#{length}"
      end
    end
  end
end
