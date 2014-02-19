class FedachFileParser
  attr_reader :response_body
  def initialize(url)
    @response_body = Faraday.get(url).body
  end

  def create_clearing_houses_params
    response_body.split("\n").each do |line|
      FedachFileWriter.create_clearing_house(to_hash(line))
    end
  end

  def clearing_house_attributes(line)
    { name: line[35..70].strip,
      routing_number: line[0..8],
      record_type: line[19],
      phone_number: line[138..147] }
  end

  def address_attributes(line)
    street = line[71..106].strip.split(", ")

    { street: street[0].strip,
      street2: street[1],
      city: line[107..126].strip,
      state: line[127..128],
      zip_code: line[129..133]
    }
  end

  def to_hash(line)
    clearing_house = clearing_house_attributes(line)
    address = address_attributes(line)

    { clearing_house: clearing_house,
      address: address }
  end
end
