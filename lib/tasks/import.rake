require "#{Rails.root}/app/helpers/application_helper"
require "#{Rails.root}/app/helpers/banks_helper"
require 'open-uri'

include ApplicationHelper
include BanksHelper

namespace :import do 
  task banks: :environment do 
    url = (Rails.env.production?) ? bank_data_url : truncated_bank_data_url
    open(url) do |f|
      f.each_line do |line|
        routing_number = line[0, 9]
        (bank = Bank.find_by(routing_number: routing_number)) ? 
          bank.update(extract_options(line)) :
          Bank.create!(extract_options(line))
      end
    end
  end
end
