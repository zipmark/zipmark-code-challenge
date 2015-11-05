module FedDataParser
  TRUNCATED_FED_DATA_ENDPOINT = 'https://gist.githubusercontent.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list'
  FED_DATA_ENDPOINT = 'https://www.frbservices.org/EPaymentsDirectory/FedACHdir.txt?AgreementSessionObject=Agree'

  def self.update_fed_data
    return_bank_objects.each { |b| b.update_or_create! }
  end

  private

  def self.fetch_file_from_uri
    Net::HTTP.get(URI.parse(TRUNCATED_FED_DATA_ENDPOINT))
  end

  def self.return_bank_objects
    fetch_file_from_uri.each_line.map do |line|
      Bank.new do |b|
        b.routing_number = line[0, 9].strip
        b.name = line[35, 36].strip
        b.record_type = 'Record Type'
        b.phone_number = nil
        b.street = line[71, 36].strip
        b.city = line[107, 20].strip
        b.state = line[127, 2].strip
        b.zip_code = line[129, 5].strip
      end
    end
  end
end
