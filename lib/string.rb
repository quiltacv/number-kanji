KANA_TO_ROM = { "1"=>"一", "2"=>"二", "3"=>"三", "4"=>"四", "5"=>"五","6"=>"六", "7"=>"七", "8"=>"八", "9"=>"九","10"=>"十","100"=>"百", "1000"=>"千", "10000"=>"万", "100000000"=>"億", "1000000000000"=>"兆" }
ROM_TO_KANA = Hash[KANA_TO_ROM.to_a.map{|m| m.reverse}]
class String
  def to_number
    result = 0
    return get_number(self) if !(self.index('兆') || self.index('億') || self.index('万'))
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
    ['兆','億','万'].each do |item|
      array.push(begin: 0, end: self.index(item)) if array.blank? && self.index(item).present?
      array.push(begin: (array.last[:end]+1), end: self.index(item)) if array.present? && self.index(item).present? && (array.last[:end]+1) <= self.index(item)
    end
    return array.push(begin: (array.last[:end]+1), end: self.length)
  end
  def to_kansuji
    return (kanji(self)) if self.length <= 5
    result = ''
    analysic.reverse.each do |array|
      result += kanji(array[:value]) + array[:key]
    end
    return result
  end
  def analysic
    array = []
    position_end = self.length
    array.push(key: '', value: self[(position_end-4)..position_end])
    position_end -= 5
    while (position_end - 4) >= 0 do
      array.push(key: get_key(array), value: self[(position_end-3)..position_end])
      position_end -= 4
    end
    return array.push(key: get_key(array), value: self[0..(position_end)])
  end
  def get_key(array)
    case array.last[:key];
    when '万'; return '億';
    when '億'; return '兆';
    else return '万'; end
  end
  def kanji(string)
    result = ''
    while string.present? do
      length = string.length
      char = string[0]
      string.slice!(0)
      next if char == '0'
      if char == '1'
        result = result.to_s + KANA_TO_ROM[(char.to_i*10**(length-1)).to_s].to_s
      else
        result = result + KANA_TO_ROM[char.to_s]
        result = result + KANA_TO_ROM[(10**(length-1)).to_s] if length>1
      end
    end
    return result.to_s
  end
end
