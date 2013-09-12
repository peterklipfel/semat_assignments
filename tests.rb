require_relative 'assignment_2'

describe Dessert do
  before do
    @cake = Dessert.new('cake', 500)
    @fruit_salad = Dessert.new('fruit salad', 150)
  end
  describe "#delicious?" do
    it "should be true" do
      @cake.should be_delicious
    end
  end
  describe '#healthy?' do
    it "should not be true for deserts over 200 calories" do
      @cake.should_not be_healthy
    end
    it "should be true for deserts that are under 200 calories" do
      @fruit_salad.should be_healthy
    end
  end
end

describe JellyBean do
  before do
    @tastey_jelly = JellyBean.new('jelly bean', 30, 'caramel')
    @nasty_jelly = JellyBean.new('jelly bean', 30, 'black licorice')
  end
  describe "#deliciious?" do
    describe "for a tastey jelly" do
      it { @tastey_jelly.should be_delicious }
    end
    describe "for a nasty jelly" do
      it { @nasty_jelly.should_not be_delicious }
    end
  end
end

describe Foo do
  describe '#attr_accessor_with_history' do
    it 'should track the number of times a variable is set' do
      f = Foo.new
      f.bar = 1
      f.bar = 'flooding'
      f.bar = :wat
      f.bar_history.length.should == 4 # because it's instantiated as nil
    end

    it "should set the correct history" do
      f = Foo.new
      f.bar = 1
      f.bar = 2
      f.bar_history.should == [nil, 1, 2]
    end
  end
end

describe Numeric do
  describe "conversions" do
    it "should convert dollars to other currencies" do
      10.dollars.in(:yen).should == 10/0.013
      10.dollars.in(:euros).should == 10/1.292
      10.dollars.in(:rupees).should == 10/0.019
    end

    it "should convert yen to other currencies" do
      10.yen.in(:dollars).should == 10*0.013
      10.yen.in(:euros).should == 10*0.013/1.292
      10.yen.in(:rupees).should == 10*0.013/0.019
    end

    it "should convert euros to other currencies" do
      10.euros.in(:dollars).should == 10*1.292
      10.euros.in(:rupees).should == 10*1.292/0.019
      10.euros.in(:yen).should == 10*1.292/0.013
    end

    it "should convert rupees to other currencies" do
      10.rupees.in(:dollars).should == 10*0.019
      10.rupees.in(:euros).should == 10*0.019/1.292
      10.rupees.in(:yen).should == 10*0.019/0.013
    end
  end
end

describe String do
  describe '#palindrome?' do
    it "should identify palindromes" do
      "abba".should be_palindrome
      "aaaaaaaaaaaaaaa".should be_palindrome
    end

    it "should identify non-palindromes" do
      "not a palindrome".should_not be_palindrome
      "a different not palindrome".should_not be_palindrome
    end
  end
end

describe Enumerable do
  describe '#palindrome' do
    it 'should identify palindrom-like enumerables' do
      [1, 2, 3, 2, 1].should be_palindrome
      [1, ["asdf", 3], {example: 3}, ["asdf", 3], 1].should be_palindrome
    end

    it "should identify non palindrom-like enumerables" do
      [1, 2, 3, 4, 5, 6, 7].should_not be_palindrome
      [["asdf", 2], 3, {:asdf => 2}].should_not be_palindrome
    end
  end
end

describe CartesianProduct do
  describe '#each' do
    it 'should iterate the correct number of times' do
      c = CartesianProduct.new([1, 2], ['1', '2'])
      i = 0
      c.each { i += 1 }
      i.should == 4
    end

    it "should handle empty arrays" do
      c = CartesianProduct.new([:a,:b], [])
      i = 0
      c.each { |elt| i+=1 }
      i.should == 0
    end
  end
end
