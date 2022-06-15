require File.join(__dir__, 'spec_helper')

describe PolishNumber do
  subject { described_class }

  describe '#in_words' do
    let(:result) { subject.in_words(number) }

    {
      0 => 'zero złotych',
      1 => 'jeden złoty',
      2 => 'dwa złote',
      4 => 'cztery złote',
      5 => 'pięć złotych',
      9 => 'dziewięć złotych',
      10 => 'dziesięć złotych',
      11 => 'jedenaście złotych',
      12 => 'dwanaście złotych',
      14 => 'czternaście złotych',
      15 => 'piętnaście złotych',
      19 => 'dziewiętnaście złotych',
      20 => 'dwadzieścia złotych',
      21 => 'dwadzieścia jeden złotych',
      22 => 'dwadzieścia dwa złote',
      24 => 'dwadzieścia cztery złote',
      25 => 'dwadzieścia pięć złotych',
      29 => 'dwadzieścia dziewięć złotych',
      30 => 'trzydzieści złotych',
      31 => 'trzydzieści jeden złotych',
      34 => 'trzydzieści cztery złote',
      35 => 'trzydzieści pięć złotych',
      45 => 'czterdzieści pięć złotych',
      32 => 'trzydzieści dwa złote',
      99 => 'dziewięćdziesiąt dziewięć złotych',
      100 => 'sto złotych',
      101 => 'sto jeden złotych',
      200 => 'dwieście złotych',
      212 => 'dwieście dwanaście złotych',
      323 => 'trzysta dwadzieścia trzy złote',
      440 => 'czterysta czterdzieści złotych',
      999 => 'dziewięćset dziewięćdziesiąt dziewięć złotych',
      1000 => 'jeden tysiąc złotych',
      1002 => 'jeden tysiąc dwa złote',
      1011 => 'jeden tysiąc jedenaście złotych',
      1111 => 'jeden tysiąc sto jedenaście złotych',
      1222 => 'jeden tysiąc dwieście dwadzieścia dwa złote',
      2415 => 'dwa tysiące czterysta piętnaście złotych',
      5000 => 'pięć tysięcy złotych',
      5001 => 'pięć tysięcy jeden złoty',
      10_000 => 'dziesięć tysięcy złotych',
      22_141 => 'dwadzieścia dwa tysiące sto czterdzieści jeden złotych',
      123_754 => 'sto dwadzieścia trzy tysiące siedemset pięćdziesiąt cztery' \
                ' złote',
      999_999 => 'dziewięćset dziewięćdziesiąt dziewięć tysięcy dziewięćset' \
                ' dziewięćdziesiąt dziewięć złotych',
      19_000_000 => 'dziewiętnaście milionów złotych',
      100_001_000 => 'sto milionów jeden tysiąc złotych',
      1_999_999 => 'jeden milion' \
      ' dziewięćset dziewięćdziesiąt dziewięć tysięcy' \
      ' dziewięćset dziewięćdziesiąt dziewięć złotych',
      999_999_999 => 'dziewięćset dziewięćdziesiąt dziewięć milionów' \
      ' dziewięćset dziewięćdziesiąt dziewięć tysięcy' \
      ' dziewięćset dziewięćdziesiąt dziewięć złotych',
      999_999_999.99 => 'dziewięćset dziewięćdziesiąt dziewięć milionów' \
      ' dziewięćset dziewięćdziesiąt dziewięć tysięcy' \
      ' dziewięćset dziewięćdziesiąt dziewięć złotych' \
      ' dziewięćdziesiąt dziewięć groszy',
      '100.23' => 'sto złotych dwadzieścia trzy grosze',
      '1234.324' => 'jeden tysiąc dwieście trzydzieści cztery złote trzydzieści' \
                    ' dwa grosze',
      '1234.326' => 'jeden tysiąc dwieście trzydzieści cztery złote trzydzieści' \
                    ' trzy grosze'
    }.each do |n, t|
      context "when number is #{n}" do
        let(:number) { n }
        let(:translation) { t }

        it "translates to #{t}" do
          expect(result).to(eq(translation))
        end
      end
    end

    context 'when number is negative' do
      let(:number) { -1 }

      it 'raises ArgumentError when number is smaller than 0' do
        expect { result }.to(raise_error(RuntimeError, 'Invalid range - (0 - 999_999_999)'))
      end
    end

    context 'when number is one billion' do
      let(:number) { 1_000_000_000 }

      it 'raises ArgumentError when number is smaller than 0' do
        expect { result }.to(raise_error(RuntimeError, 'Invalid range - (0 - 999_999_999)'))
      end
    end
  end

  describe '#with_currency' do
    let(:result) { subject.with_currency(number) }

    {
      100 => '100 złotych 0 groszy',
      '12232.43' => '12232 złote 43 grosze',
      '333.33' => '333 złote 33 grosze'
    }.each do |n, t|
      let(:number) { n }
      let(:translation) { t }

      it "translates #{n} to #{t}" do
        expect(result).to(eq(translation))
      end
    end
  end

  describe '#with_short_currency' do
    let(:result) { subject.with_short_currency(number) }

    {
      100 => '100 zł 0 gr',
      '12232.43' => '12232 zł 43 gr',
      '333.33' => '333 zł 33 gr'
    }.each do |n, t|
      let(:number) { n }
      let(:translation) { t }

      it "translates #{n} to #{t}" do
        expect(result).to(eq(translation))
      end
    end
  end
end
