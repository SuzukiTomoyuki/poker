require './player'

class Game
  def play_setrting(cards_num)
    @player1 = Player.new(cards_num)
    @player2 = Player.new(cards_num)
  end

  def play()

  end
end