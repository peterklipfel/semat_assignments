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


