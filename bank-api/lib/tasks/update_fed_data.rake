namespace :bankapi do
  desc "Update database with most recent bank data from www.frbservices.org epyaments directory"
  task update_fed_data: :environment do
    puts "#{Time.now}: Updating Fed data..."
    FedDataParser.update_fed_data
  end
end
