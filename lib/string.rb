KANA_TO_ROM = { "1"=>"一", "2"=>"二", "3"=>"三", "4"=>"四", "5"=>"五","6"=>"六", "7"=>"七", "8"=>"八", "9"=>"九", "10"=>"十","100"=>"百", "1000"=>"千", "10000"=>"万", "100000000"=>"億", "1000000000000"=>"兆" }
ROM_TO_KANA = Hash[KANA_TO_ROM.to_a.map{|m| m.reverse}]
class String
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
    return '億' if array.last[:key].to_s=='万'
    return '兆' if array.last[:key].to_s=='億'
    return '万'
    # case array.last[:key]
    # when '万'; return '億';
    # when '億'; return '兆';
    # else return '万'; end
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

class Integer
  def to_number
    string = s
    result = 0
    while string.present? do
      chars = chars.to_s + string[0].to_s
      current = ROM_TO_KANA[chars]
      if current.present?
        result = result + current.to_i
        chars = nil
        string.slice!(0)
      end
    end
    return result.to_i
  end
end
