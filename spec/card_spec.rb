require './card'
# require '../../Gemfile'
# p LOAD_PATH

describe Card do
  describe 'get_notation' do
    context '♠ と 3を入力してスートとランクを表示する' do
      let(:card) { Card.new(suit:"♠", rank:"3") }

      it '♠3 と表示される ' do
        expect(card.get_notation).to eq "♠3"
      end
      # it '♠3 と表示される（失敗パターン） ' do
      #   expect(card.get_notation).to eq "3♠"
      # end
    end
  end
end

  describe 'has_some_suit? and has_some_suit?' do
    context 'カードのスート或いはランクが一致しているかどうか ' do
      let(:three_of_spade) { Card.new(suit:"♠", rank:"3") }
      let(:three_of_hart) { Card.new(suit:"❤︎", rank:"3") }
      let(:four_of_hart) { Card.new(suit:"❤︎", rank:"4") }
      it 'ハートのスートが一致' do
        expect(three_of_hart.has_some_suit?(four_of_hart)).to be_truthy
      end
      it 'クローバーとハートのスートが一致しない ' do
        expect(three_of_spade.has_some_suit?(three_of_hart)).to be_falsey
      end
      it '3と3のランクが一致' do
        expect(three_of_spade.has_some_rank?(three_of_hart)).to be_truthy
      end
      it '3と4のランクが一致しない' do
        expect(three_of_hart.has_some_rank?(four_of_hart)).to be_falsey
      end
    end
  end


