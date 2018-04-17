require './card'

class Player
  attr_accessor :cards, :id
  def initialize(deck, cards_num, id)
    @cards = []
    @deck = deck
    @id = id
    draw_card(@deck.distribute_hand(cards_num))
  end

  def draw_card(cards)
    cards.each do |card|
      @cards.push(Card.new(suit:card.suit, rank:card.rank))
    end
  end

  def exchange_cards
    show_cards
    delete_cards_list = []
    puts "何枚交換する？"
    exchange_num = gets.to_i
    puts "どのカードを交換する？"
    1.upto(exchange_num) do
      delete_cards_index = gets.to_i - 1
      delete_cards_list.push(delete_cards_index)
    end
    delete_cards_list.sort { |x, y| y <=> x}.each do |num|
      @cards.delete_at(num)
    end
    puts "カードを配ります"
    @deck.distribute_hand(exchange_num).each do |card|
      @cards.push(Card.new(suit:card.suit, rank:card.rank))
    end
    puts
    @cards.flatten
  end

  def show_cards
    i = 0
    puts @id
    @cards.each do |card|
      i += 1
      print "[#{i}]: #{card.suit} #{card.rank} \n"
    end
    puts
  end 
end