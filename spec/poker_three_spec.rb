require './hand'
require './card'
require './poker_three'

describe PokerThree do
  describe 'open' do
    context 'プレイヤーふたりのどちらが強いかを判定' do
      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"❤︎", rank:"Q"),
                    Card.new(suit:"♣️", rank:"K")]
      player1 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"❤︎", rank:"6"),
                    Card.new(suit:"♣️", rank:"6")]
      player2 = Hand.new(*hand_array)
      let(:poker) {PokerThree.new}
      it 'プレイヤー1(♦A,❤︎Q,♣️K)とプレイヤー２(♦︎A,❤︎6,♣️6)のためストレートとペアでプレイヤー１の勝利。' do
        expect(poker.open(player1, player2)).to eq 1
      end

    
      hand_array = [Card.new(suit:"♠", rank:"3"),
                    Card.new(suit:"❤︎", rank:"3"),
                    Card.new(suit:"♣️", rank:"3")]
      player15 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"♠", rank:"2"),
                    Card.new(suit:"❤︎", rank:"2"),
                    Card.new(suit:"♣️", rank:"2")]
      player16 = Hand.new(*hand_array)
      it 'スリーカード同士だが、プレイヤー15(♠︎3,❤︎3,♣️3)とプレイヤー16(♠︎2,❤︎2,♣2)のため、プレイヤー１の勝利。' do
        expect(poker.open(player15, player16)).to eq 1
      end
      hand_array = [Card.new(suit:"♠", rank:"9"),
                    Card.new(suit:"❤︎", rank:"9"),
                    Card.new(suit:"♣️", rank:"9")]
      player17 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"♠", rank:"A"),
                    Card.new(suit:"❤︎", rank:"A"),
                    Card.new(suit:"♣️", rank:"A")]
      player18 = Hand.new(*hand_array)
      it 'スリーカード同士だが、プレイヤー17(♠︎9,❤︎9,♣️9)とプレイヤー18(♠︎A,❤︎A,♣A)のため、プレイヤー１の負け。' do
        expect(poker.open(player17, player18)).to eq -1
      end
      hand_array = [Card.new(suit:"♠", rank:"9"),
                    Card.new(suit:"❤︎", rank:"9"),
                    Card.new(suit:"♣️", rank:"9")]
      player19 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"♣️", rank:"9"),
                    Card.new(suit:"♦︎", rank:"9"),
                    Card.new(suit:"♠", rank:"9")]
      player20 = Hand.new(*hand_array)
      it 'スリーカード同士だが、プレイヤー17(♠︎9,❤︎9,♣️9)とプレイヤー18(♠︎9,❤︎9,♣9)のため、引き分け。' do
        expect(poker.open(player19, player20)).to eq 0
      end

      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"♦︎", rank:"Q"),
                    Card.new(suit:"♦︎", rank:"K")]
      player9 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"❤︎", rank:"A"),
                    Card.new(suit:"❤︎", rank:"3"),
                    Card.new(suit:"❤︎", rank:"2")]
      player10 = Hand.new(*hand_array)
      it 'ストレートフラッシュ同士だが、プレイヤー3(♦A,❤︎Q,♣️K)とプレイヤー4(♦︎A,❤︎3,♣️2)のため、プレイヤー１の勝利。' do
        expect(poker.open(player9, player10)).to eq 1
      end
      hand_array = [Card.new(suit:"❤︎", rank:"4"),
                    Card.new(suit:"❤︎", rank:"5"),
                    Card.new(suit:"❤︎", rank:"6")]
      player11 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"♣️", rank:"J"),
                    Card.new(suit:"♣️", rank:"K"),
                    Card.new(suit:"♣️", rank:"Q")]
      player12 = Hand.new(*hand_array)
      it 'ストレートフラッシュ同士だが、プレイヤー5(♦4,❤︎5,♣️6)とプレイヤー6(♦︎J,❤︎K,♣️Q)のため、プレイヤー１の負け。' do
        expect(poker.open(player11, player12)).to eq -1
      end
      hand_array = [Card.new(suit:"♣️", rank:"4"),
                    Card.new(suit:"♣️", rank:"5"),
                    Card.new(suit:"♣️", rank:"6")]
      player13 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"♠︎", rank:"4"),
                    Card.new(suit:"♠︎", rank:"5"),
                    Card.new(suit:"♠︎", rank:"6")]
      player14 = Hand.new(*hand_array)
      it 'ストレートフラッシュ同士だが、プレイヤー5(♦4,❤︎5,♣️6)とプレイヤー6(❤︎4,♠️5,♦︎6)のため、引き分け。' do
        expect(poker.open(player13, player14)).to eq 0
      end

      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"❤︎", rank:"Q"),
                    Card.new(suit:"♣️", rank:"K")]
      player3 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"❤︎", rank:"3"),
                    Card.new(suit:"♣️", rank:"2")]
      player4 = Hand.new(*hand_array)
      it 'ストレート同士だが、プレイヤー3(♦A,❤︎Q,♣️K)とプレイヤー4(♦︎A,❤︎3,♣️2)のため、プレイヤー１の勝利。' do
        expect(poker.open(player3, player4)).to eq 1
      end
      hand_array = [Card.new(suit:"♦︎", rank:"4"),
                    Card.new(suit:"❤︎", rank:"5"),
                    Card.new(suit:"♣️", rank:"6")]
      player5 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"♦︎", rank:"J"),
                    Card.new(suit:"❤︎", rank:"K"),
                    Card.new(suit:"♣️", rank:"Q")]
      player6 = Hand.new(*hand_array)
      it 'ストレート同士だが、プレイヤー5(♦4,❤︎5,♣️6)とプレイヤー6(♦︎J,❤︎K,♣️Q)のため、プレイヤー１の負け。' do
        expect(poker.open(player5, player6)).to eq -1
      end
      hand_array = [Card.new(suit:"♦︎", rank:"4"),
                    Card.new(suit:"❤︎", rank:"5"),
                    Card.new(suit:"♣️", rank:"6")]
      player7 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"❤︎", rank:"4"),
                    Card.new(suit:"♠︎", rank:"5"),
                    Card.new(suit:"♦︎", rank:"6")]
      player8 = Hand.new(*hand_array)
      it 'ストレート同士だが、プレイヤー5(♦4,❤︎5,♣️6)とプレイヤー6(❤︎4,♠️5,♦︎6)のため、引き分け。' do
        expect(poker.open(player7, player8)).to eq 0
      end
      
      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"♦︎", rank:"5"),
                    Card.new(suit:"♦︎", rank:"Q")]
      player21 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"❤︎", rank:"A"),
                    Card.new(suit:"❤︎", rank:"5"),
                    Card.new(suit:"❤︎", rank:"2")]
      player22 = Hand.new(*hand_array)
      it 'フラッシュ同士だが、プレイヤー3(♦A,♦︎5,♦︎Q)とプレイヤー4(❤︎A,❤︎5,❤︎2)のため、プレイヤー１の勝利。' do
        expect(poker.open(player21, player22)).to eq 1
      end
      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"♦︎", rank:"5"),
                    Card.new(suit:"♦︎", rank:"J")]
      player23 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"❤︎", rank:"A"),
                    Card.new(suit:"❤︎", rank:"J"),
                    Card.new(suit:"❤︎", rank:"5")]
      player24 = Hand.new(*hand_array)
      it 'フラッシュ同士だが、プレイヤー3(♦A,♦︎5,♦︎J)とプレイヤー4(❤︎A,❤︎5,❤︎J)のため、引き分け' do
        expect(poker.open(player23, player24)).to eq 0
      end
      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"♦︎", rank:"2"),
                    Card.new(suit:"♦︎", rank:"J")]
      player25 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"❤︎", rank:"A"),
                    Card.new(suit:"❤︎", rank:"J"),
                    Card.new(suit:"❤︎", rank:"5")]
      player26 = Hand.new(*hand_array)
      it 'フラッシュ同士だが、プレイヤー3(♦A,♦︎2,♦︎J)とプレイヤー4(❤︎A,❤︎5,❤︎J)のため、プレイヤー１の負け' do
        expect(poker.open(player25, player26)).to eq -1
      end

      hand_array = [Card.new(suit:"♦︎", rank:"6"),
                    Card.new(suit:"♣️", rank:"6"),
                    Card.new(suit:"♠️", rank:"Q")]
      player33 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"❤︎", rank:"5"),
                    Card.new(suit:"♠️", rank:"5"),
                    Card.new(suit:"♣️", rank:"2")]
      player34 = Hand.new(*hand_array)
      it 'ペア同士だが、プレイヤー3(♦6,♣️6,♠️Q)とプレイヤー4(❤︎5,♠︎5,♣️2)のため、プレイヤー１の勝利。' do
        expect(poker.open(player33, player34)).to eq 1
      end
      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"♣️", rank:"A"),
                    Card.new(suit:"♠️", rank:"J")]
      player35 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"❤︎", rank:"A"),
                    Card.new(suit:"♠️", rank:"A"),
                    Card.new(suit:"♣️", rank:"J")]
      player36 = Hand.new(*hand_array)
      it 'ペア同士だが、プレイヤー3(♦A,♣️A,♠️J)とプレイヤー4(❤︎A,♠️A,♣️J)のため、引き分け' do
        expect(poker.open(player35, player36)).to eq 0
      end
      hand_array = [Card.new(suit:"♦︎", rank:"2"),
                    Card.new(suit:"♣️", rank:"2"),
                    Card.new(suit:"♠️", rank:"J")]
      player37 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"❤︎", rank:"2"),
                    Card.new(suit:"♠️", rank:"2"),
                    Card.new(suit:"♣️", rank:"K")]
      player38 = Hand.new(*hand_array)
      it 'ペア同士だが、プレイヤー3(♦2,♣️2,♠️J)とプレイヤー4(❤︎A,♠️2,♣️J)のため、プレイヤー１の負け' do
        expect(poker.open(player37, player38)).to eq -1
      end

      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"♣️", rank:"5"),
                    Card.new(suit:"♠️", rank:"Q")]
      player27 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"❤︎", rank:"A"),
                    Card.new(suit:"♠️", rank:"5"),
                    Card.new(suit:"♣️", rank:"2")]
      player28 = Hand.new(*hand_array)
      it 'ハイカード同士だが、プレイヤー3(♦A,♣️5,♠️Q)とプレイヤー4(❤︎A,♠︎5,♣️2)のため、プレイヤー１の勝利。' do
        expect(poker.open(player27, player28)).to eq 1
      end
      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"♣️", rank:"5"),
                    Card.new(suit:"♠️", rank:"J")]
      player29 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"❤︎", rank:"A"),
                    Card.new(suit:"♠️", rank:"J"),
                    Card.new(suit:"♣️", rank:"5")]
      player30 = Hand.new(*hand_array)
      it 'ハイカード同士だが、プレイヤー3(♦A,♣️5,♠️J)とプレイヤー4(❤︎A,♠️5,♣️J)のため、引き分け' do
        expect(poker.open(player29, player30)).to eq 0
      end
      hand_array = [Card.new(suit:"♦︎", rank:"A"),
                    Card.new(suit:"♣️", rank:"2"),
                    Card.new(suit:"♠️", rank:"J")]
      player31 = Hand.new(*hand_array)
      hand_array = [Card.new(suit:"❤︎", rank:"A"),
                    Card.new(suit:"♠️", rank:"J"),
                    Card.new(suit:"♣️", rank:"5")]
      player32 = Hand.new(*hand_array)
      it 'ハイカード同士だが、プレイヤー3(♦A,♣️2,♠️Q)とプレイヤー4(❤︎A,♠️5,♣️J)のため、プレイヤー１の負け' do
        expect(poker.open(player31, player32)).to eq -1
      end
    end
  end
end