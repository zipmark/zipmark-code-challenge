

#appears the universal setup is if there is in fact a "comma" to split the street1 & street2
#ie: 182 MAIN ST, PO BOX 6002
determine_street_values = ->(street_csv_section = "182 MAIN ST, PO BOX 6002") {
  street_csv_section.split(/,/) #return the two items   
}

#format number
format_phone_number = ->(provided_phone_number = "2075638121") {
  provided_phone_number.split(//).reduce("###-###-####") {|new_format, next_digit|
    new_format.sub(/#/, next_digit)
  }
}

#parse the csv line to populate bank data
build_bank_object = ->(csv_line = "011175319O0110000151062712000000000ROCKVILLE BANK                      1645 ELLINGTON RD                   SOUTH WINDSOR       CT060740000860291379711") {
  street1, street2 = determine_street_values[csv_line[71, 36].strip] 
  x = {
    :name => csv_line[35, 36].strip,
    :routing_number => csv_line[0,9],
    :record_type => "Record Type",      #must have something to do with the 11 that's at the end of each line
    :phone_number => format_phone_number[csv_line[138, 10]],
    :address =>  {
      :street => street1.strip,
      :street_2 => (street2 || '').strip,
      :city => csv_line[107, 20].strip,
      :state => csv_line[127, 2],
      :zip => csv_line[129,5]
    }
  }
}

File.read(Rails.root.to_s + '/db/truncated_list').split(/\n/).each {|line|
  bank_object =  build_bank_object[line]
  bank_insert = bank_object.reject {|x| x == :address }
  address_insert = bank_object[:address]
  #puts bank_insert.inspect
  #puts address_insert.inspect
  bank = Bank.create(bank_insert)
  bank.create_address(address_insert)
}
nil

