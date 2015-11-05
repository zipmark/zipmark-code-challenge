module FixedLength
  class Parser
    DEFAULT_TYPE = 'a'

    attr_reader :columns, :body

    def initialize(columns, body)
      @columns = columns
      @body = body
    end

    def parse
      zip unpacked_body
    end


    private

    def unpacked_body
      body.lines.map do |line|
        line.unpack(unpack_format)
      end
    end

    def zip(unpacked_body)
      unpacked_body.map { |row| Hash[columns.keys.zip(row)] }
    end

    def unpack_format
      @unpack_format ||= build_unpack_format.join + "*"
    end

    def build_unpack_format
      columns.map do |_, options|
        type = options.fetch(:type, DEFAULT_TYPE)
        length = options.fetch(:length)

        "#{type}#{length}"
      end
    end
  end
end
