
class Poker
  OPEN_RESULT = { "win"=>1, "draw"=>0, "lose"=>-1}
  HAND_STRONGTH_LIST = { "straight_flash"=>0, "pair"=>1, "straight"=>2, "flash"=>3, "highcard"=>4 }

  def open(player1, player2)
    player1_hand = get_your_hand(player1)
    player2_hand = get_your_hand(player2)
    if (player1_hand < player2_hand)
      OPEN_RESULT["win"]
    else (player1_hand == player2_hand)
      check_same_hand_conditions(player1, player1_hand, player2, player2_hand)
    end
  end

  def check_same_hand_conditions(player1, player1_hand, player2, player2_hand)
    if (player1_hand == HAND_STRONGTH_LIST["straight_flash"] || player1_hand == HAND_STRONGTH_LIST["straight"])
      check_straight_hand(player1.hand_rank(), player2.hand_rank())
    elsif (player1_hand == HAND_STRONGTH_LIST["pair"])
      check_pair_hand(player1.hand_rank(), player2.hand_rank())
    elsif (player1_hand == HAND_STRONGTH_LIST["flash"] or player1_hand == HAND_STRONGTH_LIST["highcard"])
      check_flash_high_hand(player1.hand_rank(), player2.hand_rank())
    end
  end

  def check_straight_hand(player1_hand, player2_hand)
    if (player1_hand[0] + player1_hand[1]) > (player2_hand[0] + player2_hand[1])
      OPEN_RESULT["win"]
    elsif (player1_hand[0] + player1_hand[1]) < (player2_hand[0] + player2_hand[1])
      OPEN_RESULT["lose"]
    elsif (player1_hand[0] + player1_hand[1]) == (player2_hand[0] + player2_hand[1])
      OPEN_RESULT["draw"]
    end
  end

  def compere_hand_high(hand1, hand2)
    if (hand1[0] + hand1[1] > hand2[0] + hand2[1])
      OPEN_RESULT["win"]
    end
  end

  def check_pair_hand(player1_hand, player2_hand)
    if (player1_hand[0] == player2_hand[0])
      OPEN_RESULT["draw"]
    elsif (player1_hand[0] == 1)
      OPEN_RESULT["win"]
    elsif (player1_hand[0] > player2_hand[0])
      OPEN_RESULT["win"]
    elsif (player1_hand[0] < player2_hand[0])
      OPEN_RESULT["lose"]
    end
  end

  def check_flash_high_hand(player1_hand, player2_hand)
    if (player1_hand.min == 1)
      if (player1_hand.min == player2_hand.min)
        OPEN_RESULT["draw"]
      else
        OPEN_RESULT["win"]
      end
    else
      if (player1_hand.max == player2_hand.max)
        check_flash_high_hand_draw(player1_hand.min, player2_hand.min)
      elsif (player1_hand.max > player2_hand.max)
        OPEN_RESULT["win"]
      elsif (player1_hand.max < player2_hand.max)
        OPEN_RESULT["lose"]
      end
    end
  end

  def check_flash_high_hand_draw(player1_card, player2_card)
    if (player1_card == player2_card)
      OPEN_RESULT["draw"]
    elsif (player1_card > player2_card)
      OPEN_RESULT["win"]
    elsif (player1_card < player2_card)
      OPEN_RESULT["lose"]
    end
  end
  
  def get_your_hand(hand_card)
    if (hand_card.straight_flash?)
      hand_strongth = HAND_STRONGTH_LIST["straight_flash"]
    elsif (hand_card.pair?)
      hand_strongth = HAND_STRONGTH_LIST["pair"]
    elsif (hand_card.straight?)
      hand_strongth = HAND_STRONGTH_LIST["straight"]
    elsif (hand_card.flash?)
      hand_strongth = HAND_STRONGTH_LIST["flash"]
    elsif (hand_card.highcard?)
      hand_strongth = HAND_STRONGTH_LIST["highcard"]
    end
    hand_strongth   
  end
  
end