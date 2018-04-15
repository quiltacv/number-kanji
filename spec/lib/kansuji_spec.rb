require 'rails_helper'
describe Integer do
  context "should convert" do
    it "number to kanji 1223" do
      '1'.to_kansuji().should == '一'
    end
    it "number to kanji 3" do
      '3'.to_kansuji().should == '三'
    end
    it "number to kanji 10" do
      '10'.to_kansuji().should == '十'
    end
    it "number to kanji 13" do
      '13'.to_kansuji().should == '十三'
    end
    it "number to kanji 20" do
      '20'.to_kansuji().should == '二十'
    end
    it "number to kanji 24" do
      '24'.to_kansuji().should == '二十四'
    end
    it "number to kanji 100" do
      '100'.to_kansuji().should == '百'
    end
    it "number to kanji 105" do
      '105'.to_kansuji().should == '百五'
    end
    it "number to kanji 135" do
      '135'.to_kansuji().should == '百三十五'
    end
    it "number to kanji 1000" do
      '1000'.to_kansuji().should == '千'
    end
    it "number to kanji 1011" do
      '1011'.to_kansuji().should == '千十一'
    end
    it "number to kanji 1600" do
      '1600'.to_kansuji().should == '千六百'
    end
    it "number to kanji 1670" do
      '1670'.to_kansuji().should == '千六百七十'
    end
    it "number to kanji 1679" do
      '1679'.to_kansuji().should == '千六百七十九'
    end
    it "number to kanji 10000" do
      '10000'.to_kansuji().should == '一万'
    end
    it "number to kanji 20000" do
      '20000'.to_kansuji().should == '二万'
    end
    it "number to kanji 13000" do
      '13000'.to_kansuji().should == '一万三千'
    end
    it "number to kanji 60000" do
      '60000'.to_kansuji().should == '六万'
    end
    it "number to kanji 123456" do
      '123456'.to_kansuji().should == '十二万三千四百五十六'
    end
    it "number to kanji 1234567" do
      '1234567'.to_kansuji().should == '百二十三万四千五百六十七'
    end
    it "number to kanji 12345678" do
      '12345678'.to_kansuji().should == '千二百三十四万五千六百七十八'
    end
    it "number to kanji 87654321" do
      '87654321'.to_kansuji().should == '八千七百六十五万四千三百二十一'
    end
    it "number to kanji 1776655443322" do
      '1776655443322'.to_kansuji().should == '一兆七千七百六十六億五千五百四十四万三千三百二十二'
    end
    it "number to kanji 199887766" do
      '199887766'.to_kansuji().should == '一億九千九百八十八万七千七百六十六'
    end
    it "number to kanji 1020304050" do
      '1020304050'.to_kansuji().should == '十億二千三十万四千五十'
    end
    it "number to kanji 1000000000001" do
      '1000000000001'.to_kansuji().should == '一兆一'
    end
    it "number to kanji 10^16" do
      '10000000000000000'.to_kansuji().should == '一京'
    end
    it "number to kanji 10000000000007777" do
      '10000000000007777'.to_kansuji().should == '一京七千七百七十七'
    end
    it "number to kanji 100032100000000000000" do
      '100032100000000000000'.to_kansuji().should == '一垓三京二千百兆'
    end
    it "number to kanji 10^20" do
      '100000000000000000000'.to_kansuji().should == '一垓'
    end
    it "number to kanji 10^24" do
      '1000000000000000000000000'.to_kansuji().should == '一秭'
    end
    it "number to kanji 10^28" do
      '10000000000000000000000000000'.to_kansuji().should == '一穣'
    end
    it "number to kanji 10^32" do
      '100000000000000000000000000000000'.to_kansuji().should == '一溝'
    end
    it "number to kanji 10^36" do
      '1000000000000000000000000000000000000'.to_kansuji().should == '一澗'
    end
    it "number to kanji 10^40" do
      '10000000000000000000000000000000000000000'.to_kansuji().should == '一正'
    end
    it "number to kanji 10^44" do
      '100000000000000000000000000000000000000000000'.to_kansuji().should == '一載'
    end
    it "number to kanji 101234560000000000000000000000000000000000000" do
      '101234560000000000000000000000000000000000000'.to_kansuji().should == '一載百二十三正四千五百六十澗'
    end



  end
end
