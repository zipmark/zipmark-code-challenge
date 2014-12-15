module BanksHelper
  def extract_options(line)
    addr = line[71, 36].strip.split(',')
    addr[0].strip!
    addr[1].strip! if addr[1]
    {
      name: line[35, 36].strip,
      routing_number: line[0, 9],
      phone_number: line[138, 10],
      address_attributes: {
        line_1: addr[0],
        line_2: addr[1],
        city: line[107, 20].strip,
        state: line[127, 2],
        zip_code: line[129, 5]
      }
    }
  end
end
