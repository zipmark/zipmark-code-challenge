class FedachFileParser
  attr_reader :response_body
  def initialize(url)
    @response_body = Faraday.get(url).body
  end

  def find_or_create_clearing_houses
    response_body.split("\n").each do |line|
      clearing_house = ClearingHouse.find_or_create_by(clearing_house_attributes(line))
      clearing_house_address_attributes = address_attributes(line).merge(clearing_house_id: clearing_house.id)
      Address.find_or_create_by(clearing_house_address_attributes)
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
end
