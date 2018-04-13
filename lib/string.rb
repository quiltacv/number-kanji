KANA_TO_ROM = { "1"=>"一", "2"=>"二", "3"=>"三", "4"=>"四", "5"=>"五","6"=>"六", "7"=>"七", "8"=>"八", "9"=>"九",
   "10"=>"十","100"=>"百", "1000"=>"千", "10000"=>"万", "100000000"=>"億", "1000000000000"=>"兆" }
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
    return '億' if array.last[:key].to_s=='万'  # case array.last[:key]; when '万'; return '億'; when '億'; return '兆'; else return '万'; end
    return '兆' if array.last[:key].to_s=='億'
    return '万'
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

  def to_number
    result = 0
    return ROM_TO_KANA[self].to_i if self.length==1
    array = hash_kanji if self.include?('万') || self.include?('兆') || self.include?('億')
    return get_number(self).to_i if array.nil?
    array.each do |arr|
      if (arr[:key] == '万' || arr[:key] == '兆' || arr[:key] == '億') && arr[:value] != ''
        result += ROM_TO_KANA[arr[:key]].to_i * get_number(arr[:value]).to_i
      elsif arr[:key]==''
        result += get_number(arr[:value]).to_i
      elsif arr[:value]==''
        result += ROM_TO_KANA[arr[:key]].to_i
      end

    #     a = ROM_TO_KANA[arr[:key]].to_i
    #     result = ROM_TO_KANA[arr[:key]].to_i*arr[:value if arr[:value].present
    #   end
    #   puts '========='
    #   puts arr
    #   if arr[:key].present?
    #     result += get_number(arr[:value])*ROM_TO_KANA[arr[:key]].to_i
    #   else
    #     result += get_number(arr[:value])
    #   end
    end
    return result
  end

  def get_number(string)
    return ROM_TO_KANA[string].to_i if string.length == 1
    result = 0
    while string.present? do
      current = ROM_TO_KANA[string[0]].to_i
      if ROM_TO_KANA[string[1]].to_i % 10 ==0 && string[1].present? && current%10 != 0
        current = current*ROM_TO_KANA[string[1]].to_i
        string.slice!(0)
      end
      result = result + current.to_i
      string.slice!(0)
    end
    return result.to_i
  end

  def hash_kanji
    array = []
    current = ''
    string = self
    string.each_char do |se|
      if se=='億'
        array.push(key: '億', value: current)
        current=''
      elsif se=='兆'
        array.push(key: '兆', value: current)
        current=''
      elsif se=='万'
        array.push(key: '万', value: current)
        current=''
      else
        current += se
      end
    end
    return array.push(key: '', value: current)
    # array = []
    # if self.index('億').present?
    #   array.push(key: '億', value: self[0..(self.index('億')-1)])
    #   position_end = self.index('億')
    # end
    # if self.index('兆').present?
    #   array.push(key: '兆', value: self[0..(self.index('兆')-1)])
    #   position_end = self.index('兆')
    # end
    # if self.index('万').present?
    #   array.push(key: '万', value: self[0..(self.index('万')-1)])
    #   position_end = self.index('万')
    # end
    # return array.push(key: '', value: self[(position_end+1)..(self.length)])
  end
end
