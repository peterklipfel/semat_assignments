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