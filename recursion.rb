def range(a,b)
  if a == b
    [a]
  else
    range(a,b-1) << b
  end
end

def range_iter(a,b)
  arr = []
  curr = a
  (b-a+1).times do |i|
    arr << a+i
  end
  arr
end

def sum_iter(arr)
  result = 0
  arr.each do |i|
    result += i
  end
  result
end

def sum(original)
  arr = original
  if arr.length == 2
    arr[0] + arr[1]
  else
    last = arr.pop
    arr[-1] += last
    sum(arr)
  end
  
end

def exp(b, n)
  if n == 0
    1
  else
    b * exp(b, n-1)
  end
end

def exp_2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    result = exp(b, n / 2)
    result * result
  else
    result = exp(b, (n - 1) / 2)
    b * result * result
  end
end