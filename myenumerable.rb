module MyEnumerable
  def all?(&block)
    each do |element|
      return false unless block.call(element)
    end
    true
  end

  def any?(&block)
    each do |element|
      return true if block.call(element)
    end
    false
  end

  def filter(&block)
    result = []
    each do |element|
      result.push(element) if block.call(element)
    end
    result
  end
end
