# Load the Rails application.
require File.expand_path('../application', __FILE__)

require 'open-uri'
require 'net/http'
require 'rest-client'
require 'json'
require 'pry'

# Initialize the Rails application.
Rails.application.initialize!
