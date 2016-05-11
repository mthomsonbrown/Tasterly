require 'test_helper'

class FlavorStatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "a thing is there" do 
    flavor_stat = FlavorStat.create! name: "Hops"
    assert flavor_stat.name == "Hops"
  end
end
