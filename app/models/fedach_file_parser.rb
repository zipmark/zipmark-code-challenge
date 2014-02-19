class FedachFileParser
  attr_reader :response_body
  def initialize(url)
    @response_body = Faraday.get(url).body
  end
end
