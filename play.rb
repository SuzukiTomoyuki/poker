# require './deck'
# require './card'
require './hand'
require './poker_three'
require './player'


def open(poker, player1, player2)
  # puts poker.open(Hand.new(*player1.hand), Hand.new(*player2.hand))
  case poker.open(Hand.new(*player1.hand), Hand.new(*player2.hand))
  when 1 then
    puts("#{player1.id}の勝ち")
  when -1 then
    puts("#{player1.id}の負け")
  when 0 then
    puts("引き分け")
  end
end

def main
  poker = PokerThree.new
  deck = Deck.new
  player1 = Player.new(deck, 3, "player1")
  player2 = Player.new(deck, 3, "player2")
  player1.exchange_cards()
  player1.show_cards
  player2.show_cards
  open(poker, player1, player2)
end

if __FILE__ == $0
  main()
end