module HomesHelper
  def count_format(count, word)
    return if count.nil? || count.zero?
    "#{count} #{word} #{pluralize(count, 'note').split(' ')[1]}"
  end
end
