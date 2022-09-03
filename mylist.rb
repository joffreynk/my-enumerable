require_relative('./myenumerable')

class MyList
  include MyEnumerable
  def initialize(list)
    @list = listflatten
  end

  def each(&block)
    @list.each(&block)
    self
  end
end

list = MyList.new(1, 2, 3, 4)
puts(list.all? { |e| e < 5 })
puts(list.all? { |e| e > 5 })

puts(list.any? { |e| e == 2 })
puts(list.any? { |e| e == 5 })

puts(list.filter(&:even?))
# => [2, 4]
