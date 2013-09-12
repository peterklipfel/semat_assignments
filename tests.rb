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
