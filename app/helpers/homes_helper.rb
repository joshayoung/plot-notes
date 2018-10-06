module HomesHelper
  def count_format(count, word)
    return if count.nil? || count.zero?
    "<span class='inner'>#{count} #{word}</span>".html_safe
  end
end
