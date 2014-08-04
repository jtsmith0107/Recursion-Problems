# Array methods my_each, my_map, my_select. monkey patch them
require 'debugger'
class Array
  def my_each(&prc)
    (self.length).times do |i|
      prc.call self[i]
    end
  end
  
  def my_map(&prc)
    new_arr = []
    self.my_each{|i| new_arr << (prc.call(i))}
    new_arr
  end
  
  def my_map!(&prc)
    new_arr = []
    self.my_each{|i| self[self.index(i)] = (prc.call(i))}
    self
  end
  
  def my_select(&prc)
    new_arr = []
    self.my_each{|i| new_arr << i if prc.call(i)}
    new_arr
  end
  
  
  #prc = {|sum, elem| elem + 5}
  def my_inject(&prc)
      result = 0
        
    self.my_each do |i|
      result = prc.call(result,i)
    end
    result 
  end
  
  def my_sort!(&prc)
    swap_made = true
    while swap_made
      swap_made = false
      
      (self.length-1).times do |i|
        if prc.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i+1], self[i]
          swap_made = true
        end#if
      end#times
      
    end#while
    self
  end#def
  
  def my_sort(&prc)
    self.dup.my_sort! &prc
  end
end


def eval_block(*params,&prc)
  #params => [1,2,3,4,5]
  unless block_given?
    puts "NO BLOCK GIVEN"
  else
     prc.call(*params)
  end
end

eval_block("Kerry", "Washington", 23) do |fname, lname, score|
  puts "#{lname}, #{fname} won #{score} votes."
end

test = eval_block(1,2,3,4,5) do |*args|
  # args => [[1,2,3,4,5]]
  args.inject(:+)
end
# => 15
p test

eval_block(1, 2, 3)
# => "NO BLOCK GIVEN"