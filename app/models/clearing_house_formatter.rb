class ClearingHouseFormatter
  def self.format(clearing_house)
    ch_attributes = desired_attributes(clearing_house)


    a_attributes = clearing_house.address.attributes

    a_attributes.delete("created_at")
    a_attributes.delete("updated_at")
    ch_attributes.merge({"address" => a_attributes})
  end

  def self.desired_attributes(object)
    object_attributes = object.attributes
    remove_undesired_keys(object_attributes)
    object_attributes
  end

  def self.remove_undesired_keys(object_attributes)
    object_attributes.delete("created_at")
    object_attributes.delete("updated_at")
  end
end
