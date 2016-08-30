require 'http'

class BankDataParser
  def self.trim(str)
    str.split(" ").join(" ")
  end

  def self.parse_date(str)
    DateTime.parse("20#{str[4..5]}-#{str[0..1]}-#{str[2..3]}")
  end

  def self.fetch_bank_data
    HTTP.get("https://gist.githubusercontent.com/jakehow/3d96b83c4a4a1e6313d4/raw/f2990b4cef86fe9454ba1a643ccee118ca0b5757/truncated_list").to_s
  end

  def initialize
    @data = BankDataParser.fetch_bank_data
  end

  def parse_bank_data(data)
    data = {
      routing_num: @data[0...9],
      office_code: @data[9],
      frb_num: @data[10...19].to_i,
      record_type_code: @data[19].to_i,
      last_change_date: BankDataParser.parse_date(@data[20...26]),
      new_routing_num: @data[26...34],
      cust_name: BankDataParser.trim(@data[35...71]),
      address: BankDataParser.trim(@data[71...107]),
      city: BankDataParser.trim(@data[107...127]),
      state_code: @data[127...129],
      zipcode: @data[129...134],
      zipcode_ext: @data[134...138],
      tel_area_code: @data[138...141],
      tel_prefix: @data[141...144],
      tel_suffix: @data[144...148],
      inst_status__code: @data[148].to_i,
      data_view_code: @data[149].to_i
    }
  end

  def banks
    banks = []
    idx = 0
    bank_data_length = 156
    (@data.length/bank_data_length).times do
      banks.push(parse_bank_data([idx...idx+bank_data_length]))
      idx+=bank_data_length
    end
    banks
  end
end
