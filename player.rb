require './card'
require './hand'
require './deck'

# 依存度が高いかも？
class Player
  attr_accessor :hand, :id
  def initialize(deck, cards_num, id)
    @hand = []
    @deck = deck
    @id = id
    draw_card(@deck.distribute_hand(cards_num))
  end

  def draw_card(cards)   # cards
    cards.each do |hand|
      @hand.push(Card.new(suit:hand.suit, rank:hand.rank))
    end
  end

  # IN/OUTはクラスには持たせないほうがいい(mainでやろう)  つまりgets puts
  def exchange_cards
    show_cards
    delete_cards_list = []
    puts "何枚交換する？"
    exchange_num = gets.to_i
    puts "どのカードを交換する？"
    1.upto(exchange_num) do
      delete_cards_list.push(gets.to_i - 1)   # 変数化したほうがいい
    end
    delete_cards_list.sort { |x, y| y <=> x}.each do |num|
      @hand.delete_at(num)
    end
    puts "カードを配ります"
    @deck.distribute_hand(exchange_num).each do |hand|
      @hand.push(Card.new(suit:hand.suit, rank:hand.rank))
    end
    puts
    @hand.flatten
  end

  def show_cards
    i = 0
    puts @id
    @hand.each do |hand|      # each withを使う
      i += 1
      print "[#{i}]: #{hand.suit} #{hand.rank} \n"
    end
    puts
  end 
end