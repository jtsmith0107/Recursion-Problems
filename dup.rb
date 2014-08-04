#[[
def deep_dup arr
  new_arr = []
  unless arr.is_a? Array
    return arr
  else
    arr.each do |elem|
      new_arr << deep_dup(elem) 
    end
  end
  new_arr   
end