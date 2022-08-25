module Myenumerable 
  def all?(&block)
    each do |element|
      if(block.call(element) == false) 
        return false
      end
    end
    true
  end

  def any?(&block)
    each do |element|
      if(block.call(element) == true) 
        return true
      end
    end
    false
  end

  def filter(&block)
    result = []
    each do |element|
      if(block.call(element) == true) 
        result.push(element)
      end
    end
    result
  end

end

class MyList
  include Myenumerable
  def initialize(list)
    @list = list
  end

  def each(&block)
    @list.each(&block)
    self
  end

end

list = MyList.new([1, 2, 3, 4])
puts(list.all? {|e| e < 5})
puts(list.all? {|e| e > 5})

puts(list.any? {|e| e == 2})
puts(list.any? {|e| e == 5})

puts(list.filter {|e| e.even?})
# => [2, 4]
