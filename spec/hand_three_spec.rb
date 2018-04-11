require './hand'
require './card'

describe Hand do
	describe 'straight?' do
		context '3枚のカードがストレートになっているかを判定' do
			hand_array = [Card.new(suit:"❤︎", rank:"3"),
										Card.new(suit:"❤︎", rank:"4"),
										Card.new(suit:"❤︎", rank:"5")]
			let(:hand_straight_flash) { Hand.new(*hand_array)}
			it '❤︎3と❤︎4と❤︎5のストレートフラッシュです。クール!!!' do
				expect(hand_straight_flash.straight_flash?).to be_truthy
			end
		end
  end
	describe 'three_of_a_kind?' do
		context '3枚のカードがスリーカードになっているかを判定' do
			hand_array = [Card.new(suit:"♠", rank:"3"),
										Card.new(suit:"❤︎", rank:"3"),
										Card.new(suit:"♣️", rank:"3")]
			let(:hand_three_of_a_kind) { Hand.new(*hand_array)}
			it 'ランク３のスリーカードです。やったぜ' do
				expect(hand_three_of_a_kind.three_of_a_kind?).to be_truthy
			end
		end
	end
	describe 'straight?' do
		context '3枚のカードがストレートになっているかを判定' do
			hand_array = [Card.new(suit:"♠", rank:"3"),
										Card.new(suit:"❤︎", rank:"4"),
										Card.new(suit:"♣️", rank:"5")]
			let(:hand_straight) { Hand.new(*hand_array)}
			it '♠︎3と❤︎4と♣︎5のストレートです。やったぜ!!!' do
				expect(hand_straight.straight?).to be_truthy
			end
			hand_array3 = [Card.new(suit:"♠", rank:"A"),
										Card.new(suit:"❤︎", rank:"Q"),
										Card.new(suit:"♣️", rank:"K")]
			let(:hand_straight3) { Hand.new(*hand_array3)}
			it '♣︎Aと❤︎Qと♣︎Kのストレートです！やりますねぇ！' do
				expect(hand_straight3.straight?).to be_truthy
			end
			hand_array2 = [Card.new(suit:"♠", rank:"2"),
										Card.new(suit:"❤︎", rank:"A"),
										Card.new(suit:"♣️", rank:"K")]
			let(:hand_straight2) { Hand.new(*hand_array2)}
			it '♣︎2と❤︎Aと♣︎Kのストレート・・・ではない！残念だったな' do
				expect(hand_straight2.straight?).to be_falsey
			end
		end
  end
  describe 'pair?' do
		context '3枚のカードがペアになっているかを判定' do
			hand_array = [Card.new(suit:"♠", rank:"3"),
                  Card.new(suit:"❤︎", rank:"3"),
                	Card.new(suit:"♣️", rank:"A")]
			let(:hand_pair) { Hand.new(*hand_array)}
      it '♠︎3と❤︎3のペアがあったよ。よかったね' do
				expect(hand_pair.pair?).to be_truthy
			end
		end
	end
	
	describe 'highcard?' do
		context '3枚のカードがハイカードになっているかを判定' do
			hand_array = [Card.new(suit:"♠", rank:"J"),
                  Card.new(suit:"❤︎", rank:"3"),
                	Card.new(suit:"♣️", rank:"A")]
			let(:hand_highcard) { Hand.new(*hand_array)}
      it '♠︎Jと❤︎3と♣️Aのハイカードだった。ふぁっきゅー' do
				expect(hand_highcard.highcard?).to be_truthy
			end
		end
  end
end