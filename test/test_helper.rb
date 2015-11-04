ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# adapted for minitest from lostisland/faraday_middleware
module FaradayMiddlewareSetup
  def setup
    @options = {}
    @headers = {}

    @middleware = Fedache.new(->(env) { Faraday::Response.new(env) })

    super
  end

  def process(body, content_type = nil, options = {})
    env = {
      body: body,
      request: options,
      request_headers: Faraday::Utils::Headers.new,
      response_headers: Faraday::Utils::Headers.new(@headers)
    }

    env[:response_headers]['content-type'] = content_type if content_type
    yield(env) if block_given?
    @middleware.call(Faraday::Env.from(env))
  end
end

module LoadBankFixture
  def setup
    @bank_file ||= load_bank_file
    super
  end

  def load_bank_file
    relative_path = File.join(%w[test fixtures files list.txt])
    full_path = Rails.root.join(relative_path)

    File.read(full_path)
  end
end
