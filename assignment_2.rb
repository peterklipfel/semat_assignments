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
        @#{attr_name}_history ||= []
        @#{attr_name}_history << val
        @#{attr_name} = val
      end
    ]
  end
end

class Foo
  attr_accessor_with_history :bar
end
