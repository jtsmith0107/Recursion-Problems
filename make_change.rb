require 'debugger'

def make_change_greedy(value, coin_denom)
#  coins = coin_denom.sort.reverse
  coins = coin_denom.dup
  change_list = []
  if coins.empty?
    change_list
  else
    coin = coins.shift 
    (value/coin).times {  change_list << coin} 
    change_list + make_change_greedy(value%coin, coins)
  end
end

#stack overflows
def make_change_borked(value, coin_denom)
  coin_denom.sort!.reverse!
  change_list = []
  if coin_denom.empty?
    change_list
  else
    coin_denom.each_with_index do |coin, index|
      if value >= coin
        value -= coin
        change_list << coin
      else
        return make_change(value, coin_denom[index..-1])
      end
    end
  change_list + make_change(value, coin_denom)
  
  end
end

def make_change(value, coin_denom)

  if coin_denom.empty?
    return []
  end

  best_change = make_change_greedy(value, coin_denom)
  

  coin = coin_denom.first
  debugger
  new_change = [coin] + make_change_greedy(value - coin, coin_denom[1..-1])
  if best_change.count > new_change.count

    best_change = new_change
    [coin] + make_change(value-coin, coin_denom[1..-1])

  else
    best_change
  end
  
  
end