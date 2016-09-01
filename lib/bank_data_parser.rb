class BankDataParser
  def self.trim(str)
    str.split(" ").join(" ")
  end

  def self.parse_date(str)
    "20#{str[4..5]}-#{str[0..1]}-#{str[2..3]}"
  end

  def initialize(data)
    @data = data
  end

  def parse_bank_data(data)
    parsed_data = {
      routing_num: data[0...9],
      office_code: data[9],
      frb_num: data[10...19].to_i,
      record_type_code: data[19].to_i,
      last_change_date: BankDataParser.parse_date(data[20...26]),
      new_routing_num: data[26...34],
      cust_name: BankDataParser.trim(data[35...71]),
      street_address: BankDataParser.trim(data[71...107]),
      city: BankDataParser.trim(data[107...127]),
      state: data[127...129],
      zipcode: data[129...134],
      zipcode_ext: data[134...138],
      tel_number: "#{data[138...141]}-#{data[141...144]}-#{data[144...148]}",
      inst_status__code: data[148].to_i,
      data_view_code: data[149].to_i
    }
  end

  def raw_bank_data
    banks = []
    idx = 0
    bank_data_length = 156
    (@data.length/bank_data_length).times do
      banks.push(@data[idx...idx+bank_data_length])
      idx+=bank_data_length
    end
    banks
  end

  def banks
    raw_bank_data.map { |bank| parse_bank_data(bank) }
  end

end
