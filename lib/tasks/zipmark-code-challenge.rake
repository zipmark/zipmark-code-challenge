namespace :zipmark do
  desc "Parse Federal Listings for any Bank Updates"
  task parse_for_updates: :environment do
    puts "Parsing for updates..."
    BanksReader.parse_for_updates
  end
end