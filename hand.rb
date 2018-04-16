class Hand
	attr_accessor :my_hand
	
	def initialize(*card)
		@my_hand = card
	end
	
	def straight_flash?()
		straight?() and flash?()
	end

	def three_of_a_kind?()
		for i in 0..@my_hand.length - 2
			if(@my_hand[i].rank == @my_hand[i+1].rank)
				for j in i+2..@my_hand.length - 1
					return true if @my_hand[i].rank == @my_hand[j].rank
				end
			end
		end
		false
	end

	def straight?()
		my_hand_rank_array = hand_rank()
		diff_max_min_num = my_hand_rank_array.length - 1
		if ((my_hand_rank_array.min - my_hand_rank_array.max).abs == diff_max_min_num)
			return true
		elsif ((my_hand_rank_array.min - my_hand_rank_array.max).abs == 12)
			if (my_hand_rank_array.sum < 17 and my_hand_rank_array.length != 2)
				return false
			else 
				return true
			end
		else
			return false
		end
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
		rank_array = []
		@my_hand.each do |num|
			rank_array.push(num.rank)
		end
		rank_array
	end

	def hand_suit()
		suit_array = []
		@my_hand.each do |num|
			suit_array.push(num.suit)
		end
		suit_array
	end
		
end
