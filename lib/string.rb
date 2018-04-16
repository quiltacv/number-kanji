require 'datatables'
class String
  def to_number
    return get_number(self) if !KEY.any?{|key| self.include?(key)}
    potision_begin = 0
    result = 0
    KEY.reverse.each do |item|
      if self.index(item).present?
          result += get_number(self[potision_begin..self.index(item)-1]).to_i * ROM_TO_KANJI[item].to_i # >0
          potision_begin = self.index(item) + item.length
      end
    end
    return result += get_number(self[potision_begin..self.length]).to_i
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
