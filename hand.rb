class Hand
	attr_accessor :my_hand
	
	def initialize(*card)
		@my_hand = card
	end
	
	def straight_flash?()
		straight?() and flash?()
	end

	def three_of_a_kind?()
		return true if (hand_rank().uniq.length == 1)
		false
	end

	def straight?()
		my_hand_ranks = hand_rank().sort!
		if my_hand_ranks[0] == 1
			my_hand_ranks = [my_hand_ranks.sort[1], my_hand_ranks.sort[2], 14]
		end
		return true if [my_hand_ranks[0] - my_hand_ranks.min, my_hand_ranks[1] - my_hand_ranks.min, my_hand_ranks[2] - my_hand_ranks.min] == [0,1,2]
		false
	end

	def flash?()
		return true if (hand_suit().uniq.length == 1)
		false
	end
	
	def pair?()
		return true if (hand_rank().uniq.length == @my_hand.length - 1)
		false
	end

	def highcard?()
		!pair?() and !flash?()
	end

	def hand_rank()
		@my_hand.map { |item| item.rank }
	end

	def hand_suit()
		@my_hand.map { |item| item.suit }
	end
		
end
