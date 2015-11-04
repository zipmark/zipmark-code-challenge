module FixedLength
  module Column
    def self.extended(base)
      class << base
        def columns
          @columns ||= {}
        end

        def column(name, options)
          columns[name] = options
        end
      end
    end
  end
end
