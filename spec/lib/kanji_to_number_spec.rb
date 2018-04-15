require 'rails_helper'
describe Integer do
  context "should convert" do
      it "number to kanji 一" do
        '一'.to_number().should == 1
      end
      it "number to kanji 三" do
        '三'.to_number().should == 3
      end
      it "number to kanji 十" do
        '十'.to_number().should == 10
      end
      it "number to kanji 十三" do
        '十三'.to_number().should == 13
      end
      it "number to kanji 二十" do
        '二十'.to_number().should == 20
      end
      it "number to kanji 十二" do
        '十二'.to_number().should == 12
      end
      it "number to kanji 百" do
        '百'.to_number().should == 100
      end
      it "number to kanji 百五" do
        '百五'.to_number().should == 105
      end
      it "number to kanji 百三十五" do
        '百三十五'.to_number().should == 135
      end
      it "number to kanji 千" do
        '千'.to_number().should == 1000
      end
      it "number to kanji 千十一" do
        '千十一'.to_number().should == 1011
      end
      it "number to kanji 千六百" do
        '千六百'.to_number().should == 1600
      end
      it "number to kanji 千六百七十" do
        '千六百七十'.to_number().should == 1670
      end
      it "number to kanji 千六百七十九" do
        '千六百七十九'.to_number().should == 1679
      end
      it "number to kanji 万" do
        '一万'.to_number().should == 10000
      end
      it "number to kanji 万三千" do
        '一万三千'.to_number().should == 13000
      end
      it "number to kanji 六万" do
        '六万'.to_number().should == 60000
      end
      it "number to kanji 六万七千八百三十四" do
        '六万七千八百三十四'.to_number().should == 67834
      end
      it "number to kanji 三千四百五十六" do
        '一万二千三百四十五'.to_number().should == 12345
      end
      it "number to kanji 千二百三十四" do
        '千二百三十四'.to_number().should == 1234
      end
      it "number to kanji 十二万三千四百五十六6" do
        '十二万三千四百五十六'.to_number().should == 123456
      end
      it "number to kanji 百二十三万四千五百六十七" do
        '百二十三万四千五百六十七'.to_number().should == 1234567
      end
      it "number to kanji 千二百三十四万五千六百七十八" do
        '千二百三十四万五千六百七十八'.to_number().should == 12345678
      end
      it "number to kanji 八千七百六十五万四千三百二十一" do
        '八千七百六十五万四千三百二十一'.to_number().should == 87654321
      end
      it "number to kanji 一兆七千七百六十六億五千五百四十四万三千三百二十二" do
        '一兆七千七百六十六億五千五百四十四万三千三百二十二'.to_number().should == 1776655443322
      end
      it "number to kanji 一億九千九百八十八万七千七百六十六" do
        '一億九千九百八十八万七千七百六十六'.to_number().should == 199887766
      end
      it "number to kanji 六百二十四兆七千八百二億四千二十万四千二百四" do
        '六百二十四兆七千八百二億四千二十万四千二百四'.to_number().should == 624780240204204
      end
      it "number to kanji 千百十一兆千百十一億千百十一万千百十一" do
        '千百十一兆千百十一億千百十一万千百十一'.to_number().should == 1111111111111111
      end
      it "number to kanji 十億二千三十万四千五十" do
        '十億二千三十万四千五十'.to_number().should == 1020304050
      end
      ### new
      it "number to kanji 一兆一" do
        '一兆一'.to_number().should == 1000000000001
      end
      it "number to kanji 京" do
        '一京'.to_number().should == 10000000000000000
      end

  end
end
