# require './hand'
# require './card'

# describe Hand do
# 	describe 'pair?' do
# 		context '2枚のカードがペアになっているかを判定' do
# 			hand_array = [Card.new(suit:"♠", rank:"3"),
# 									Card.new(suit:"❤︎", rank:"3")]
# 			let(:hand_pair) { Hand.new(*hand_array)}
# 			it 'ランク３同士のペアです。おめでとう' do
# 				expect(hand_pair.pair?).to be_truthy
# 			end
# 		end
# 	end
# 	describe 'flash?' do
# 		context '2枚のカードがフラッシュになっているかを判定' do
# 			hand_array = [Card.new(suit:"❤︎", rank:"8"),
# 									Card.new(suit:"❤︎", rank:"3")]
# 			let(:hand_flash) { Hand.new(*hand_array)}
# 			it 'スート❤︎同士のフラッシュです。おめでとう' do
# 				expect(hand_flash.flash?).to be_truthy
# 			end
# 		end
# 	end
# 	describe 'highcard?' do
# 		context '二枚のカードが役なしのハイカードになっているかを判定' do
# 			hand_array = [Card.new(suit:"♣️", rank:"8"),
# 									Card.new(suit:"❤︎", rank:"10")]
# 			let(:hand_highcard) { Hand.new(*hand_array)}
# 			it '♣️8と❤︎3…残念ですハイカード' do
# 				expect(hand_highcard.highcard?).to be_truthy
# 			end
# 		end
# 	end
# 	describe 'straight?' do
# 		context '二枚のカードがストレートになっているかを判定' do
# 			hand_array = [Card.new(suit:"♣️", rank:"A"),
# 									Card.new(suit:"❤︎", rank:"K")]
# 			let(:hand_straight) { Hand.new(*hand_array)}
# 			it '♣️1と❤︎2でランクが連続してある為ストレート' do
# 				expect(hand_straight.straight?).to be_truthy
# 			end
# 		end
# 	end
# 	describe 'straight_flash?' do
# 		context '二枚のカードがストレートフラッシュになっているかを判定' do
# 			hand_array = [Card.new(suit:"♦︎", rank:"K"),
# 									Card.new(suit:"♦︎", rank:"Q")]
# 			let(:hand_straight_flash) { Hand.new(*hand_array) }
# 			it '♦︎Kと♦︎Qでランクが連続しているかつ同じスートである為ストレートフラッシュ' do
# 				expect(hand_straight_flash.straight_flash?).to be_truthy
# 			end
# 		end
# 	end
# end