require './card'

class Deck
  attr_accessor :foregoing_card
  attr_accessor :cards

  CardStruct = Struct.new(:suit, :rank)
  def initialize
    @foregoing_card = []
    @cards = []
  end
  
  def distribute_hand(hands_num)
    while !create_hand(hands_num) do 
    end
    return self.cards
  end
  
  def create_hand(hands_num)
    suit_list = ["❤︎", "♣️", "♠︎", "♦︎"]
    rank_list = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    self.cards = []
    hands_num.times{
      suit_tmp = suit_list.sample
      rank_tmp = rank_list.sample
      return false if check_duplication(self.cards, rank_tmp, suit_tmp) or self.foregoing_card.include?(rank_tmp + suit_tmp)
      self.cards.push(CardStruct.new(suit_tmp, rank_tmp))
    }
    self.cards.each do |val|
      self.foregoing_card.push(val.rank + val.suit)
      # p val.rank + val.suit
    end
    true
  end

  def check_duplication(cards, rank, suit)
    cards.each{|card_val|
      return true if (card_val.rank == rank and card_val.suit == suit)
    }
    false
  end
end

def main
  deck = Deck.new
  while !deck.create_hand(5) do
  end
  puts
  while !deck.create_hand(5) do
  end
end

if __FILE__ == $0
  main()
end