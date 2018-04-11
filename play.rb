require './deck'
require './card'
require './hand'
require './poker_three'

def main
  deck = Deck.new
  player1_hand = deck.distribute_hand(3)
  player2_hand = deck.distribute_hand(3)
  player1_hand_array = []
  player2_hand_array = []
  player1_hand.each do | hand |
    player1_hand_array.push(Card.new(suit:hand.suit, rank:hand.rank))
    p hand
  end
  puts
  player2_hand.each do | hand |
    player2_hand_array.push(Card.new(suit:hand.suit, rank:hand.rank))
    p hand
  end
  player1 = Hand.new(*player1_hand_array)
  player2 = Hand.new(*player2_hand_array)
  poker = PokerThree.new
  if (poker.open(player1, player2) == 1)
    puts("プレイヤー１のかち")
  elsif (poker.open(player1, player2) == -1)
    puts("プレイヤー１の負け")
  elsif (poker.open(player1, player2) == 0)
    puts("引分け")
  end

end

if __FILE__ == $0
  main()
end