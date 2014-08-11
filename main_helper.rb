module ProcessMethods
  
  def shovel_for(array, num_of_chars)
    arr = []
    for i in (0..3) 
      arr << array[start_index + i]
    end
    return arr
  end

  def array_splitter(array, num_of_chars)
    puts "FACTORING ERROR" and return unless array.length % num_of_chars == 0
    i = 0
    arr = []
    unit_array = []
    ( array.length / num_of_chars ).times do 
      for j in (0..num_of_chars) do 
        unit_array << array[i + j] 
      end
      arr << unit_array.join  
      unit_array = []  
      i += num_of_chars
    end
    return arr
  end

  def stripper(array)
    arr = []
    array.each { |value| arr << value.strip }
    return arr
  end

  def before_comma(array)
    /.*,/.match(array) ? /.*,/.match(array)[0] : array.strip
  end

  def after_comma(array)
    /,.*/.match(array)[0].match(/[^,].*/)[0].strip if /,.*/.match(array)
  end

end