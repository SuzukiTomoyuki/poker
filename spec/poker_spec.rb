# require './hand'
# require './card'
# require './poker'

# describe Poker do
#   describe 'open' do
#     context 'プレイヤーふたりのどちらが強いかを判定' do
#       hand_array = [Card.new(suit:"♦︎", rank:"K"),
#                   Card.new(suit:"♦︎", rank:"Q")]
#       player1 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"♠", rank:"3"),
#                   Card.new(suit:"❤︎", rank:"3")]
#       player2 = Hand.new(*hand_array)
#       let(:poker) {Poker.new()}
#       it 'プレイヤー１︎（K＆♦︎Q）とプレイヤー２（♠３＆❤︎３）でプレイヤー１の勝ちです' do
#         expect(poker.open(player1, player2)).to eq 1
#       end

#       hand_array = [Card.new(suit:"♦︎", rank:"K"),
#                   Card.new(suit:"♦︎", rank:"Q")]
#       player1 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"❤︎", rank:"2"),
#                   Card.new(suit:"❤︎", rank:"A")]
#       player2 = Hand.new(*hand_array)
#       it 'どちらもストレートフラッシュで♦プレイヤー１︎（♦︎K＆♦︎Q）とプレイヤー２（❤︎2と❤︎A）のためプレーヤー１の勝ちです' do
#         expect(poker.open(player1, player2)).to eq 1
#       end

#       hand_array = [Card.new(suit:"♠︎", rank:"K"),
#                   Card.new(suit:"♦︎", rank:"A")]
#       player3 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"❤︎", rank:"Q"),
#                   Card.new(suit:"❤︎", rank:"K")]
#       player4 = Hand.new(*hand_array)
#       it 'どちらもストレートフラッシュで♦プレイヤー3（❤︎2と❤︎A）とプレイヤー4（♦︎K＆♦︎Q）のためプレーヤー１の負けです' do
#         expect(poker.open(player3, player4)).to eq -1
#       end

#       hand_array = [Card.new(suit:"♦︎", rank:"K"),
#                   Card.new(suit:"♦︎", rank:"Q")]
#       player5 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"❤︎", rank:"Q"),
#                   Card.new(suit:"❤︎", rank:"K")]
#       player6 = Hand.new(*hand_array)
#       it 'どちらもストレートフラッシュで♦プレイヤー１5（♦︎K＆♦︎Q）とプレイヤー6（❤︎2と❤︎A）のため引き分けです' do
#         expect(poker.open(player5, player6)).to eq 0
#       end

#       hand_array = [Card.new(suit:"♦︎", rank:"K"),
#                   Card.new(suit:"❤︎", rank:"A")]
#       player21 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"❤", rank:"2"),
#                   Card.new(suit:"♠︎", rank:"A")]
#       player22 = Hand.new(*hand_array)
#       it 'どちらもストレートで♦プレイヤー１︎（♦︎K＆♦︎Q）とプレイヤー２（❤︎2と♠︎A）のためプレーヤー１の勝ちです' do
#         expect(poker.open(player21, player22)).to eq 1
#       end

#       hand_array = [Card.new(suit:"♠︎", rank:"2"),
#                  Card.new(suit:"♦︎", rank:"A")]
#       player3 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"♦︎", rank:"Q"),
#                  Card.new(suit:"❤︎", rank:"K")]
#       player4 = Hand.new(*hand_array)
#       it 'どちらもストレートで♦プレイヤー3（♠︎2と♦︎A）とプレイヤー4（❤︎K＆♦︎Q）のためプレーヤー１の負けです' do
#         expect(poker.open(player3, player4)).to eq -1
#       end

#       hand_array = [Card.new(suit:"♦︎", rank:"J"),
#                  Card.new(suit:"♣️", rank:"Q")]
#       player7 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"❤︎", rank:"Q"),
#                  Card.new(suit:"♣️", rank:"J")]
#       player8 = Hand.new(*hand_array)
#       it 'どちらもストレートで♦プレイヤー１5（♦︎J＆♣️Q）とプレイヤー6（❤︎Qと♣️J）のため引き分けです' do
#         expect(poker.open(player7, player8)).to eq 0
#       end

#       hand_array = [Card.new(suit:"♦︎", rank:"Q"),
#                   Card.new(suit:"❤︎", rank:"Q")]
#       player9 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"❤", rank:"A"),
#                   Card.new(suit:"♠︎", rank:"A")]
#       player10 = Hand.new(*hand_array)
#       it 'どちらもペアで♦プレイヤー9（♦︎Q＆♦︎Q）とプレイヤー10（❤︎Aと♣️A）のためプレーヤー9の勝ちです' do
#         expect(poker.open(player9, player10)).to eq 1
#       end

#       hand_array = [Card.new(suit:"♠︎", rank:"2"),
#                   Card.new(suit:"♦︎", rank:"2")]
#       player11 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"❤︎", rank:"K"),
#                   Card.new(suit:"♠️", rank:"K")]
#       player12 = Hand.new(*hand_array)
#       it 'どちらもペアで♦プレイヤー11（♠︎2と♦︎2）とプレイヤー12（❤︎K＆♠️K）のためプレーヤー11の負けです' do
#         expect(poker.open(player11, player12)).to eq -1
#       end

#       hand_array = [Card.new(suit:"♦︎", rank:"J"),
#                   Card.new(suit:"♣️", rank:"J")]
#       player13 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"❤︎", rank:"J"),
#                   Card.new(suit:"♣︎", rank:"J")]
#       player14 = Hand.new(*hand_array)
#       it 'どちらもペアで♦プレイヤー13（♦︎J＆♣️J）とプレイヤー14（❤︎Jと♣️J）のため引き分けです' do
#         expect(poker.open(player13, player14)).to eq 0
#       end

#       hand_array = [Card.new(suit:"❤︎", rank:"4"),
#                   Card.new(suit:"❤︎", rank:"K")]
#       playerA = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"♠︎", rank:"3"),
#                   Card.new(suit:"♠︎", rank:"K")]
#       playerB = Hand.new(*hand_array)
#       it 'どちらもフラッシュで♦プレイヤーA（❤︎4＆❤︎K）とプレイヤーB（♠︎3と♠︎K）のためプレーヤーAの勝ちです' do
#         expect(poker.open(playerA, playerB)).to eq 1
#       end

#       hand_array = [Card.new(suit:"♠︎", rank:"3"),
#                   Card.new(suit:"♠︎", rank:"6")]
#       player17 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"❤︎", rank:"2"),
#                   Card.new(suit:"❤︎", rank:"J")]
#       player18 = Hand.new(*hand_array)
#       it 'どちらもフラッシュで♦プレイヤー17（♠︎Aと♠︎2）とプレイヤー18（❤︎10＆❤︎J）のためプレーヤー17の負けです' do
#         expect(poker.open(player17, player18)).to eq -1
#       end

#       hand_array = [Card.new(suit:"♦︎", rank:"K"),
#                   Card.new(suit:"♦︎", rank:"3")]
#       player19 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"❤︎", rank:"3"),
#                   Card.new(suit:"❤︎", rank:"A")]
#       player20 = Hand.new(*hand_array)
#       it 'どちらもフラッシュで♦プレイヤー19（♦︎K＆♦︎3）とプレイヤー20（❤︎3と❤︎K）のため引き分けです' do
#         expect(poker.open(player19, player20)).to eq 0
#       end

#       hand_array = [Card.new(suit:"♠︎", rank:"2"),
#                   Card.new(suit:"❤︎", rank:"K")]
#       playerC = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"❤︎", rank:"J"),
#                   Card.new(suit:"♠︎", rank:"4")]
#       playerD = Hand.new(*hand_array)
#       it 'どちらもハイカードで♦プレイヤーC（♠︎2＆❤︎K）とプレイヤーD（❤︎Jと♠︎4）のためプレーヤーCの勝ちです' do
#       expect(poker.open(playerC, playerD)).to eq 1
#       end

#       hand_array = [Card.new(suit:"♠︎", rank:"A"),
#                   Card.new(suit:"❤︎", rank:"2")]
#       player17 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"♠︎", rank:"10"),
#                   Card.new(suit:"❤︎", rank:"J")]
#       player18 = Hand.new(*hand_array)
#       it 'どちらもハイカードで♦プレイヤー17（♠︎Aと❤︎2）とプレイヤー18（♠︎10＆❤︎J）のためプレーヤー17の負けです' do
#       expect(poker.open(player17, player18)).to eq -1
#       end

#       hand_array = [Card.new(suit:"♦︎", rank:"K"),
#                   Card.new(suit:"❤︎", rank:"3")]
#       player19 = Hand.new(*hand_array)
#       hand_array = [Card.new(suit:"♣️", rank:"3"),
#                   Card.new(suit:"♠︎", rank:"K")]
#       player20 = Hand.new(*hand_array)
#       it 'どちらもハイカードで♦プレイヤー19（♦︎K＆♦︎3）とプレイヤー20（♣️3と♠︎K）のため引き分けです' do
#       expect(poker.open(player19, player20)).to eq 0
#       end
#     end
#   end
#   describe 'check_flash_high_hand' do
#     context '二人のプレーヤーのフラッシュとハイカードが同じだった時の判定をみる' do
#       let(:poker) {Poker.new()}
#       it 'AとJ vs KとJ' do
#         expect(poker.check_flash_high_hand([10,11], [10,9])).to eq 1
#       end
#     end
#   end
#   describe 'check_pere_hand' do
#     context 'ふたりのプレイヤーのペアの判定をみる（ふたりとも同じ役だった場合）' do
#       let(:poker) {Poker.new()}
#       it 'AとA vs JとJ' do
#         expect(poker.check_flash_high_hand([1,1], [11,11])).to eq 1
#       end
#     end
#   end
#   describe 'check_straight_hand' do
#     context 'ふたりのプレイヤーのストレート判定をみる' do
#       let(:poker) {Poker.new()}
#       it 'Aと2 vs 8と9' do
#         expect(poker.check_straight_hand([1,2], [8,9])).to eq -1
#       end
#     end
#   end
# end