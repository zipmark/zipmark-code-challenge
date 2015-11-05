class ImportBankData
  ENDPOINT = Rails.application.config.bank_data_sources[:truncated]

  class << self
    attr_reader :connection

    def import
      response_body.each do |row|
        Bank.find_or_create_by(row)
      end
    end
    alias_method :call, :import

    def response_body
      connection.get.body
    end

    def connection
      @connection ||= Faraday.new(url: ENDPOINT) do |c|
        c.use Fedache

        c.adapter Faraday.default_adapter
      end
    end
  end
end
