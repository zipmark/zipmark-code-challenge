class ClearingHouseFormatter
  def self.execute(clearing_house)
    ch_attributes = desired_attributes(clearing_house)
    ch_attributes = format_clearing_house_attributes(ch_attributes)

    a_attributes = desired_attributes(clearing_house.address)

    ch_attributes.merge({"address" => a_attributes})
  end

  def self.desired_attributes(object)
    object_attributes = object.attributes
    remove_undesired_keys(object_attributes)
    object_attributes = titleize_attributes(object_attributes)
    object_attributes
  end

  def self.remove_undesired_keys(object_attributes)
    object_attributes.delete("street2") unless object_attributes["street2"]

    ["created_at", "updated_at", "id", "clearing_house_id"].each do |key|
      object_attributes.delete(key)
      object_attributes.delete(key)
    end
  end

  def self.format_clearing_house_attributes(clearing_house_attributes)
    phone_number = clearing_house_attributes["phone_number"]
    clearing_house_attributes["phone_number"] = format_phone_number(phone_number)
    record_type = clearing_house_attributes["record_type"]
    clearing_house_attributes["record_type"] = record_types[record_type]

    clearing_house_attributes
  end

  def self.format_phone_number(phone_number)
    "#{phone_number[0..2]}-#{phone_number[3..5]}-#{phone_number[6..9]}"
  end

  def self.titleize_attributes(attributes)
    attributes.each do |key, value|
      unless titleize_blacklist.include? key
        attributes[key] = ActiveSupport::Inflector.titleize(attributes[key])
      end
    end
  end

  def self.titleize_blacklist
    ["state", "phone_number"]
  end

  def self.record_types
    {"0" => "Institution is a Federal Reserve Bank",
     "1" => "Send items to customer routing number",
     "2" => "Send items to customer using new routing number field"}
  end

end
