#########################################################
############# Part 1
#########################################################

class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    return true if @calories < 200
    false
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    @flavor = flavor
    super name, calories
  end

  def delicious?
    return false if @flavor == "black licorice"
    super
  end
end

#########################################################
############# Part 2
#########################################################

class Class
  # creates method for all ruby classes
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s       # make sure it's a string
    attr_reader attr_name            # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q[
      def #{attr_name}=(val)
        @#{attr_name}_history ||= [nil]
        @#{attr_name}_history << val
        @#{attr_name} = val
      end
    ]
  end
end

class Foo
  attr_accessor_with_history :bar
end


#########################################################
############# Part 3
#########################################################

class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1.0}
  def in currency
    self * 1/@@currencies[currency.to_s.gsub( /s$/, '')]
  end

  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
end

class String
  def palindrome?
    self.gsub(/[^a-zA-Z]/, '').downcase.to_s == self.gsub(/[^a-zA-Z]/, '').downcase.to_s.reverse
  end
end

module Enumerable
  def palindrome?
    self == self.reverse
  end
end


#########################################################
############# Part 4
#########################################################

class CartesianProduct
  include Enumerable
  def initialize(list1, list2)
    @cross_product = list1.map {|ele1| list2.map { |ele2| [ele1, ele2] } }.flatten(1)
  end

  def each
    @cross_product.each{ yield }
  end
end
