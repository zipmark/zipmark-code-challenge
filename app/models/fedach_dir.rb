class FedachDir
  BANKS_FILE = "https://gist.githubusercontent.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list"

  def self.to_hash(row)
      hash = {}

      # general bank data
      hash[:name]           = row[35..70].strip
      hash[:routing_number] = row[0..8].strip
      hash[:record_type]    = row[19..19].strip

      # phone
      hash[:phone_number]   = row[138..147].strip

      # address fields
      street, street2       = row[71..106].split(",")
      hash[:street]         = street.strip
      hash[:street2]        = street2.strip if street2
      hash[:city]           = row[107..126].strip
      hash[:state]          = row[127..128].strip
      hash[:zip_code]       = row[129..133].strip + '-' + row[134..137].strip

      hash
  end

  def self.import
    raw = Faraday.get(BANKS_FILE).body
    raw.split("\n").each do |row|
      Bank.find_or_create_by(to_hash(row))
    end
  end
end
