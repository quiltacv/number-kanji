require 'datatables'
class String
  def to_number(result = 0, potision_begin = 0)
    return get_number(self) if !KEY.any?{ |key| self.include?(key) }
    KEY.reverse.each do |item|
      if self.index(item).present?
          result += get_number(self[potision_begin..self.index(item)-1]).to_i * ROM_TO_KANJI[item].to_i # >0
          potision_begin = self.index(item) + item.length
      end
    end
    return result += get_number(self[potision_begin..self.length]).to_i
  end
  def get_number(string, result = 0)
    begin
      current = ROM_TO_KANJI[string[0]].to_i
      current = current * ROM_TO_KANJI[string.slice!(1..1) ].to_i if ROM_TO_KANJI[string[1]].to_i % 10 == 0 && string[1].present? && current % 10 != 0
      (string.length == 1) ? (return (result + current.to_i)) : result += current.to_i
    end while string.slice!(0).present?
  end
end
class Numeric
  def to_kansuji(result = '')
    return KANA_TO_ROM[self] if self==0
    return (kanji_to_demo(self.to_s)) if self.to_s.length <= 5
    self.to_s.reverse.split('').each_slice(4).each.with_index do |fa, index|
      key = (index > 0) ? KEY[index-1] : '' if fa.reverse.join('').to_i > 0 # defined?(result).nil? ? result=(kanji_to_demo(fa.reverse.join('')).to_s + key.to_s) : result=(kanji_to_demo(fa.reverse.join('')).to_s + key.to_s + result.to_s)
      result=(kanji_to_demo(fa.reverse.join('')).to_s + key.to_s + result.to_s)
    end
    return result
  end
  def kanji_to_demo(string, kan = '')
    begin
      return (string[0] == '0') ? kan : (kan += KANA_TO_ROM[string[0].to_i]) if string.length == 1 #why a.to_s ma @kan='' but @kan = nil
      next if string[0] == '0'
      next kan += KANA_TO_ROM[string[0].to_i] + KANA_TO_ROM[(10**(string.length-1))] if string[0] != '1'
      kan += '一' if string.length >= 5 # duoi 10000 k co 一
      kan += KANA_TO_ROM[(string[0].to_i * 10**(string.length-1))] #xu ly so 1
    end while string.slice!(0).present?
  end
end
