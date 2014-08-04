require 'debugger'

def merge(list)
  #split the list
  #call merge on each side, which we must TRUST will return a sorted list
  #we are left with the two sides, sorted within themselves
  #call merge_down, passing each side as an argument
    
  if list.size <= 1
    return list
  else
    center_index = list.length / 2
    left_side = list[0...center_index]
    right_side = list[center_index..-1]

    left_merge = merge(left_side)
    right_merge = merge(right_side)

    return merge_down(left_merge, right_merge)
  end  
end

def merge_down(left, right)
  #pluck the first elements from each list constructing a sorted one and return
  result = []

  until left.empty? || right.empty?
    if left[0] >= right[0]
      result << right.shift
    else
      result << left.shift
    end
  end # left with 1 element in either
  
  if left.empty?
    result << right.shift
  else
    result << left.shift
  end
  
  return result
 

end
