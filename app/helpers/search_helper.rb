module SearchHelper
  def format_phone_number(phone_number)
    "#{phone_number[0..2]}-#{phone_number[3..5]}-#{phone_number[6..9]}"
  end

  def record_types
    {"0" => "Institution is a Federal Reserve Bank",
     "1" => "Send items to customer routing number",
     "2" => "Send items to customer using new routing number field"}
  end
end
