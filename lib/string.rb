require 'datatables'
class String
  def to_number
    result = 0
    return get_number(self) if !KEY.any?{|key| self.include?(key)}
    hash_kanji.each do |array|
      return result += get_number(self[array[:begin]..(array[:end])]).to_i  if hash_kanji.last == array
      if array[:end] - array[:begin] == 0
        result += ROM_TO_KANJI[array[:key]].to_i
      else
        result += get_number(self[array[:begin]..(array[:end]-1)]).to_i * ROM_TO_KANJI[array[:key]].to_i # >0
      end
    end
  end
  def get_number(string)
    result = 0
    while string.present? do
      current = ROM_TO_KANJI[string[0]].to_i
      if ROM_TO_KANJI[string[1]].to_i % 10 == 0 && string[1].present? && current % 10 != 0 #eample: 20,200,2020
        current = current*ROM_TO_KANJI[string[1]].to_i
        string.slice!(0)
      end
      result += current.to_i
      return result if string.length == 1
      string.slice!(0)
    end
  end
  def hash_kanji
    array = []
    KEY.reverse.each do |item|
      array.push(begin: 0, end: self.index(item), key: item) if array.blank? && self.index(item).present?
      array.push(begin: (array.last[:end]+array.last[:key].length), end: self.index(item), key: item) if array.present? && self.index(item).present? && (array.last[:end]+1) <= self.index(item)
    end
    return array.push(begin: (array.last[:end]+array.last[:key].length), end: self.length, key:'')
  end
end
class Numeric
  def to_kansuji()
    return (kanji_to_demo(self.to_s)) if self.to_s.length <= 5
    result = ''
    self.to_s.reverse.split('').each_slice(4).each.with_index do |fa, index|
      key = index > 0 ? KEY[index-1] : '' if fa.reverse.join('').to_i > 0 # defined?(result).nil? ? result=(kanji_to_demo(fa.reverse.join('')).to_s + key.to_s) : result=(kanji_to_demo(fa.reverse.join('')).to_s + key.to_s + result.to_s)
      result=(kanji_to_demo(fa.reverse.join('')).to_s + key.to_s + result.to_s)
    end
    return result
  end
  def kanji_to_demo(string)
    kan = ''
    while string do
      if string[0] != '0'
        return (kan = kan.to_s + KANA_TO_ROM[string[0].to_i]) if string.length == 1 #why a.to_s ma @kan='' but @kan = nil
        if string[0] == '1' && string.length >= 5 # duoi 10000 k co 一
          kan = kan.to_s + '一'.to_s + KANA_TO_ROM[(string[0].to_i*10**(string.length-1))].to_s #xu ly so 1
        elsif string[0] == '1' #tren 10000 co so 一
          kan = kan.to_s + KANA_TO_ROM[(string[0].to_i*10**(string.length-1))].to_s  #xu ly so 1
        else
          kan = kan.to_s + KANA_TO_ROM[string[0].to_i].to_s + KANA_TO_ROM[(10**(string.length-1))].to_s
        end
      end
      string.slice!(0)
      return kan if string.length == 0
    end
  end
end
