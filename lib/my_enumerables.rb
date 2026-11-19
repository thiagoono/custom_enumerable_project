module Enumerable
  # Your code goes here
  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    self.size.times { |number| yield(self[number], number) }
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    new_array = []
    self.each { |element| new_array << element if yield(element) }
    new_array
  end

  def my_all?
    return to_enum(:my_all?) unless block_given?

    self.each { |element| return false unless yield(element) }
    true
  end

  def my_any?
    return to_enum(:my_any?) unless block_given?

    self.each { |element| return true if yield(element) }
    false
  end

  def my_none?
    return to_enum(:my_none?) unless block_given?

    self.each { |element| return false if yield(element) }
    true
  end

  def my_count(input = nil)
    count = 0
    if input
      self.each { |element| count += 1 if element == input }
      return count
    end

    return self.size unless block_given?

    self.each { |element| count += 1 if yield(element) }
    count
  end

  def my_map
    return to_enum(:my_map) unless block_given?

    mapped_array = []
    self.each { |element| mapped_array << yield(element) }
    mapped_array
  end

  def my_inject(starting_value = self[0])
    return to_enum(:my_inject) unless block_given?

    accumulator = starting_value
    self.each { |element| accumulator = yield(accumulator, element) }
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    self.size.times { |number| yield(self[number]) } if block_given?
    self
  end
end
