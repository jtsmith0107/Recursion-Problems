require 'debugger'

def binary_search(list, target)
  if list.empty?
    return nil
  elsif list.length == 1
    target == list.first ? 0 : nil
  else
    center_index = list.length/2
    pivot = list[list.length/2]
    case target <=> pivot
    when -1
      return binary_search(list[0...center_index], target)
    when 1
      result = binary_search(list[(center_index + 1)..-1], target)
      if result
        return center_index + result + 1
      else
        nil
      end
    when 0
      center_index
    end
  end
end