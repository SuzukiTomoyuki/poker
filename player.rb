require './card'
require './hand'
require './deck'

class Player
  attr_accessor :hand, :id
  def initialize(deck, cards_num, id)
    @hand = []
    @deck = deck
    @id = id
    draw_card(@deck.distribute_hand(cards_num))
  end

  def draw_card(player_hand)
    i = 0
    player_hand.each do |hand|
      i += 1
      @hand.push(Card.new(suit:hand.suit, rank:hand.rank))
    end
  end

  def exchange_cards
    show_cards
    cards_array_temp = Marshal.load(Marshal.dump(@hand))
    delete_cards_list = []
    puts "何枚交換する？"
    exchange_num = gets.to_i
    puts "どのカードを交換する？"
    1.upto(exchange_num) do
      delete_cards_list.push(gets.to_i - 1)
    end
    delete_cards_list.sort {|x,y|y<=>x}.each do |num|
      cards_array_temp.delete_at(num)
    end
    puts "カードを配ります"
    @deck.distribute_hand(exchange_num).each do |hand|
      cards_array_temp.push(Card.new(suit:hand.suit, rank:hand.rank))
    end
    puts
    @hand = cards_array_temp.flatten
  end

  def show_cards
    i = 0
    puts @id
    @hand.each do |hand|
      i += 1
      print "[#{i}]: #{hand.suit} #{hand.rank} \n"
    end
    puts
  end 
end