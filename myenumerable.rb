module MyEnumerable 
  def all?(&block)
    each do |element|
      if(!block.call(element)) 
        return false
      end
    end
    true
  end

  def any?(&block)
    each do |element|
      if(block.call(element)) 
        return true
      end
    end
    false
  end

  def filter(&block)
    result = []
    each do |element|
      if(block.call(element)) 
        result.push(element)
      end
    end
    result
  end
end