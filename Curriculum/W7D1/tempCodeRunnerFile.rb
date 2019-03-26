def my_min(list)
  min = list.first
  (1...list.length - 1).each do |first|
    (first...list.length).each do |second|
      first < second ? min = first : min = second
    end
  end
  min
end