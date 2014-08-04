def fib(n)
  fibs_arr = [1,1]  
   if n == 0
     []
   elsif n == 1
     [0]
   elsif n == 2
     [0,1]
  else
    last_fibs = fib(n-1)
    last_fibs + [last_fibs[-2] + last_fibs[-1]]    
  end
end

def fib_iter(n)
  fib_array = [1,1]
  return 1 if n < 2
  n.times do
    fib_array << fib_array[-2] + fib_array[-1]
  end
  fib_array
end