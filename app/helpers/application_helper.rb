module ApplicationHelper
  def hili(str, kw)
    str.gsub(/#{kw}/i) { |s| "<font color='red' style='background-color:yellow'><b>#{s}</b></font>" }
  end
end
