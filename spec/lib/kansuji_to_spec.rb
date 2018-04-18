require 'rails_helper'
describe Integer do
  context "should convert" do
    # it "number to kanji 0" do
    #   0.to_kansuji.should == '零'
    # end
    # it "number to kanji 0" do
    #   000000.to_kansuji.should == '零'
    # end
    # it "number to kanji 0" do
    #   0000001.to_kansuji.should == '一'
    # end
    # it "number to kanji 1223" do
    #   1.to_kansuji.should == '一'
    # end
    # it "number to kanji 3" do
    #   3.to_kansuji.should == '三'
    # end
    # it "number to kanji 10" do
    #   10.to_kansuji.should == '十'
    # end
    # it "number to kanji 13" do
    #   13.to_kansuji.should == '十三'
    # end
    # it "number to kanji 20" do
    #   20.to_kansuji.should == '二十'
    # end
    # it "number to kanji 24" do
    #   24.to_kansuji.should == '二十四'
    # end
    # it "number to kanji 100" do
    #   100.to_kansuji.should == '百'
    # end
    # it "number to kanji 105" do
    #   105.to_kansuji.should == '百五'
    # end
    # it "number to kanji 135" do
    #   135.to_kansuji.should == '百三十五'
    # end
    # it "number to kanji 1000" do
    #   1000.to_kansuji.should == '千'
    # end
    # it "number to kanji 1011" do
    #   1011.to_kansuji.should == '千十一'
    # end
    # it "number to kanji 1010" do
    #   1010.to_kansuji.should == '千十'
    # end
    # it "number to kanji 1600" do
    #   1600.to_kansuji.should == '千六百'
    # end
    # it "number to kanji 1670" do
    #   1670.to_kansuji.should == '千六百七十'
    # end
    # it "number to kanji 1679" do
    #   1679.to_kansuji.should == '千六百七十九'
    # end
    # it "number to kanji 10000" do
    #   10000.to_kansuji.should == '一万'
    # end
    # it "number to kanji 20000" do
    #   20000.to_kansuji.should == '二万'
    # end
    it "number to kanji 13000" do
      13000.to_kansuji.should == '一万三千'
    end
    it "number to kanji 60000" do
      60000.to_kansuji.should == '六万'
    end
    # it "number to kanji 10101" do
    #   10101.to_kansuji.should == '一万百一'
    # end
    it "number to kanji 123456" do
      123456.to_kansuji.should == '十二万三千四百五十六'
    end
    # it "number to kanji 1234567" do
    #   1234567.to_kansuji.should == '百二十三万四千五百六十七'
    # end
    # it "number to kanji 12345678" do
    #   12345678.to_kansuji.should == '千二百三十四万五千六百七十八'
    # end
    # it "number to kanji 87654321" do
    #   87654321.to_kansuji.should == '八千七百六十五万四千三百二十一'
    # end
    # it "number to kanji 1776655443322" do
    #   1776655443322.to_kansuji.should == '一兆七千七百六十六億五千五百四十四万三千三百二十二'
    # end
    # it "number to kanji 199887766" do
    #   199887766.to_kansuji.should == '一億九千九百八十八万七千七百六十六'
    # end
    # it "number to kanji 1020304050" do
    #   1020304050.to_kansuji.should == '十億二千三十万四千五十'
    # end
    # it "number to kanji 1000000000001" do
    #   1000000000001.to_kansuji.should == '一兆一'
    # end
    # it "number to kanji 10^16" do
    #   (10 ** 16).to_kansuji.should == '一京'
    # end
    # it "number to kanji 10000000000007777" do
    #   10000000000007777.to_kansuji.should == '一京七千七百七十七'
    # end
    # it "number to kanji 100032100000000000000" do
    #   100032100000000000000.to_kansuji.should == '一垓三京二千百兆'
    # end
    # it "number to kanji 10^20" do
    #   (10 **20).to_kansuji.should == '一垓'
    # end
    # it "number to kanji 10^24" do
    #   (10 ** 24).to_kansuji.should == '一𥝱'
    # end
    # it "number to kanji 10^28" do
    #   (10 ** 28).to_kansuji.should == '一穣'
    # end
    # it "number to kanji 10^32" do
    #   (10 ** 32).to_kansuji.should == '一溝'
    # end
    # it "number to kanji 10^36" do
    #   (10 ** 36).to_kansuji.should == '一澗'
    # end
    # it "number to kanji 10^40" do
    #   (10 ** 40).to_kansuji.should == '一正'
    # end
    # it "number to kanji 10^44" do
    #   (10 ** 44).to_kansuji.should == '一載'
    # end
    # it "number to kanji ('10123456'+ 10 ** 36)" do
    #   ('10123456'+ (10 ** 36).to_s).to_i.to_kansuji.should == '一載百二十三正四千五百六十一澗'
    # end
    # it "number to kanji 1233524650345235465796552341233234" do
    #   1233524650345235465796552341233234.to_kansuji.should == '十二溝三千三百五十二穣四千六百五十𥝱三千四百五十二垓三千五百四十六京五千七百九十六兆五千五百二十三億四千百二十三万三千二百三十四'
    # end
    # it "number to kanji 1234567890098765432112345678900987654321234567890" do
    #   1234567890098765432112345678900987654321234567890.to_kansuji.should == '一極二千三百四十五載六千七百八十九正九十八澗七千六百五十四溝三千二百十一穣二千三百四十五𥝱六千七百八十九垓九十八京七千六百五十四兆三千二百十二億三千四百五十六万七千八百九十'
    # end
    # it "number to kanji 10 ^ 48" do
    #   (10 ** 48).to_kansuji.should == '一極'
    # end
    # it "number to kanji 10 ^ 52" do
    #   (10 ** 52).to_kansuji.should == '一恒河沙'
    # end
    # it "number to kanji ('7'+('10'*26))" do
    #   ('7'+'10'*26).to_i.to_kansuji.should == '七恒河沙千十極千十載千十正千十澗千十溝千十穣千十𥝱千十垓千十京千十兆千十億千十万千十'
    # end
    # it "number to kanji 10 ^ 56" do
    #   (10 ** 56).to_kansuji.should == '一阿僧祇'
    # end
    # it "number to kanji ('111223344' +('0' * 48))" do
    #   ('111223344' +('0' * 48)).to_i.to_kansuji.should == '一阿僧祇千百二十二恒河沙三千三百四十四極'
    # end
    # it "number to kanji 10^60" do
    #   (10 ** 60).to_kansuji.should == '一那由他'
    # end
    # it "number to kanji 10^60" do
    #   (10 ** 64).to_kansuji.should == '一不可思議'
    # end
    # it "number to kanji ('7'+'10'*32)" do
    #   ('7'+'10'*32).to_i.to_kansuji.should == '七不可思議千十那由他千十阿僧祇千十恒河沙千十極千十載千十正千十澗千十溝千十穣千十𥝱千十垓千十京千十兆千十億千十万千十'
    # end
    # it "number to kanji 1234567898765434567898765456" do
    #   1234567898765434567898765456.to_kansuji.should == '千二百三十四𥝱五千六百七十八垓九千八百七十六京五千四百三十四兆五千六百七十八億九千八百七十六万五千四百五十六'
    # end
    # it "number to kanji 102030404000001112000211101010" do
    #   102030404000001112000211101010.to_kansuji.should == '十穣二千三十𥝱四千四十垓千百十二兆二億千百十万千十'
    # end
    # it "number to kanji 10101020200202020303030404002202010101010" do
    #   10101020200202020303030404002202010101010.to_kansuji.should == '一正百一澗二百二溝二十穣二千二十𥝱三千三十垓三千四十京四千二兆二千二十億千十万千十'
    # end
  end
end
