module ApplicationHelper
  def hili(str, kw)
    kw_arr = kw.to_s.strip.split('!')
    kw_arr.each do |k|
      str = str.gsub(/#{k}/i) { |s| "<font color='red' style='background-color:yellow'><b>#{s}</b></font>" }
    end
    str
  end
end
