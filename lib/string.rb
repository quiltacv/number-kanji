KANA_TO_ROM = { "1"=>"一", "2"=>"二", "3"=>"三", "4"=>"四", "5"=>"五","6"=>"六", "7"=>"七", "8"=>"八", "9"=>"九","10"=>"十","100"=>"百",
   "1000"=>"千", "10000"=>"万", "100000000"=>"億", "1000000000000"=>"兆", "10000000000000000"=> "京","100000000000000000000"=>"垓" , "10000000000000000000000000"=>"秭",
   "10000000000000000000000000000"=> "穣", "100000000000000000000000000000000"=>"溝","1000000000000000000000000000000000000"=>"澗", "10000000000000000000000000000000000000000"=>"正",
    "100000000000000000000000000000000000000000000"=>"載"}
ROM_TO_KANA = Hash[KANA_TO_ROM.to_a.map{|m| m.reverse}]
KEY = ['万','億','兆','京','垓','秭','穣','溝','澗','正','載']
#KE  ['10^4','億','兆','京','垓','秭','穣','溝','澗','正','10^44']
class String
  def check
    KEY.each do |key|
      return false if self.index(key)
    end
    return true
  end

  def to_number
    result = 0
    # return get_number(self) if !(self.index('兆') || self.index('億') || self.index('万'))
    return get_number(self) if check
    hash_kanji_to.each do |array|
      return result += get_number(self[array[:begin]..(array[:end])]).to_i  if hash_kanji_to.last == array
      result += get_number(self[array[:end]]).to_i if array[:end] - array[:begin] == 0
      result += get_number(self[array[:begin]..(array[:end]-1)]).to_i * get_number(self[array[:end]]).to_i if array[:end] - array[:begin] > 0
    end
  end
  def get_number(string)
    result = 0
    while string.present? do
      current = ROM_TO_KANA[string[0]].to_i
      if ROM_TO_KANA[string[1]].to_i % 10 == 0 && string[1].present? && current % 10 != 0 #eample: 20,200,2020
        current = current*ROM_TO_KANA[string[1]].to_i
        string.slice!(0)
      end
      result += current.to_i
      return result if string.length == 1
      string.slice!(0)
    end
  end
  def hash_kanji_to
    array = []
    KEY.reverse.each do |item|
      array.push(begin: 0, end: self.index(item)) if array.blank? && self.index(item).present?
      array.push(begin: (array.last[:end]+1), end: self.index(item)) if array.present? && self.index(item).present? && (array.last[:end]+1) <= self.index(item)
    end
    return array.push(begin: (array.last[:end]+1), end: self.length)
  end
  def to_kansuji
    return KANA_TO_ROM[self].to_s if KANA_TO_ROM[self].present?
    return (kanji_to(self)) if self.length <= 5
    @position_end = self.length
    @array = []
    analysic_refactor.reverse.each do |array|
      kanji_to(array[:value])
      @a += array[:key] if array[:backup].to_i > 0
    end
    return @a
  end
  def analysic_refactor
    return @array.push(key: get_key(@array), value: self[0..(@position_end-1)], backup: self[0..(@position_end-1)]) if @position_end - 4 <= 0 # chia 4,4,4,4,
    @array.push(key: get_key(@array), value: self[(@position_end - 4)..@position_end-1], backup: self[(@position_end - 4)..@position_end-1]) if @array.present?
    @array.push(key: '', value: self[(@position_end - 4)..@position_end], backup: self[(@position_end - 4)..@position_end]) if @array.blank?
    @position_end -= 4
    analysic_refactor
  end
  def get_key(array)
    return KEY[@array.size-1]
  end
  def kanji_to(string)
    return @a.to_s if string.length == 0
    if string[0] != '0'
      return (@a = @a.to_s + KANA_TO_ROM[string[0]].to_s) if string.length == 1 #why a.to_s ma @a='' but @a = nil
      @a = @a.to_s + KANA_TO_ROM[(string[0].to_i*10**(string.length-1)).to_s].to_s if string[0] == '1' #xu ly so 1
      @a = @a.to_s + KANA_TO_ROM[string[0].to_s].to_s + KANA_TO_ROM[(10**(string.length-1)).to_s].to_s if string[0] != '1'
    end
    string.slice!(0)
    kanji_to(string)
  end
end
