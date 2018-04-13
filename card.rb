class Card

  attr_accessor :suit
  attr_accessor :rank

  def initialize(suit:, rank:)
    rank_list = { "A"=>1, "J"=>11, "Q"=>12, "K"=>13 }
    @suit = suit
    if rank.to_i == 0
      @rank = rank_list[rank]
    else
      @rank = rank.to_i
    end
  end

  def get_notation()
    @suit + @rank.to_s
  end

  def has_some_suit?(card)
    self.suit == card.suit
  end

  def has_some_rank?(card)
    self.rank == card.rank
  end

end
