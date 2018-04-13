require './deck'
require './card'
require './hand'
require './poker_three'


def open(poker, player1, player2)
  if (poker.open(player1, player2) == 1)
    puts("プレイヤー１のかち")
  elsif (poker.open(player1, player2) == -1)
    puts("プレイヤー１の負け")
  elsif (poker.open(player1, player2) == 0)
    puts("引分け")
  end
end

def select_exchange_card(deck, hand_array)
  hand_array_temp = Marshal.load(Marshal.dump(hand_array))
  puts "[1]交換する \n[2]交換しない"
  num = gets.to_i
  case num
  when 1 then
    puts "何枚？"
    exchange_num = gets.to_i
    delete_card_list = []
    puts "どのカード？"
    1.upto(exchange_num) do | num |
      delete_card_list.push(gets.to_i - 1)
    end
    delete_card_list.sort{|x,y|y<=>x}.each do | num |
      hand_array_temp.delete_at(num)
    end
    puts "カードを配ります"
    deck.distribute_hand(exchange_num).each do | hand |
      hand_array_temp.push(Card.new(suit:hand.suit, rank:hand.rank))
    end
    hand_array_temp.flatten!
  when 2 then
  else
    "正しい値を入力してください"
  end
  hand_array_temp
end

def main
  deck = Deck.new
  player1_hand = deck.distribute_hand(3)
  player2_hand = deck.distribute_hand(3)
  player1_hand_array = []
  player2_hand_array = []
  i = 0
  player1_hand.each do | hand |
    i += 1
    player1_hand_array.push(Card.new(suit:hand.suit, rank:hand.rank))
    print "[#{i}]: #{hand.suit} #{hand.rank} \n"
  end
  puts
  player2_hand.each do | hand |
    player2_hand_array.push(Card.new(suit:hand.suit, rank:hand.rank))
    # print "#{hand.suit} #{hand.rank} \n"
  end
  player1_hand_array = select_exchange_card(deck, player1_hand_array)
  print "プレイヤー１: "
  player1_hand_array.each do |hand|
    print "#{hand.suit} #{hand.rank}  "
  end
  puts
  print "プレイヤー２: "
  player2_hand_array.each do |hand|
    print "#{hand.suit} #{hand.rank}  "
  end
  puts
  player1 = Hand.new(*player1_hand_array)
  player2 = Hand.new(*player2_hand_array)
  poker = PokerThree.new
  open(poker, player1, player2)

end

if __FILE__ == $0
  main()
end