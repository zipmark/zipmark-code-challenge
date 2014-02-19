class FedachFileParser
  attr_reader :response_body
  def initialize(url)
    @response_body = Faraday.get(url).body
  end

  def find_or_create_clearing_houses
  end
end
