class Bank < ActiveRecord::Base
  TRUNCATED_URL = 'https://gist.githubusercontent.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list'
  FULL_URL = 'https://www.frbservices.org/EPaymentsDirectory/FedACHdir.txt'

  def self.get_data
    banks = []
    open('data/truncated_list.txt').each_line do |line|
      l = line.unpack('A9A18A44A36A20A2A5A*')
      banks << Bank.new.tap do |b|
        b.routing_number = l[0]
        b.name = l[2].scan(/[^0]/).join('')
        b.record_type = 'Record Type'
        b.phone_number = nil
        b.street = l[3]
        b.city = l[4]
        b.state = l[5]
        b.zip_code = l[6]
        b.save
      end
    end
    banks
  end
end
