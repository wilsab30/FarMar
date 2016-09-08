require_relative 'spec_helper'
require_relative '../far_mar' # this is the module file


describe 'Test Market.rb' do

it 'FarMar::Market must return an array' do
expect(FarMar::Market.all).must_be_instance_of(Array)
end

it 'FarMar::Market.all must return all objects' do
expect(FarMar::Market.all.length).must_equal(500)
end

it 'FarMar::Market must return correct instance' do
expect(FarMar::Market.find(488).wont_be_nil(true))
end
it 'FarMar::Market must return object data' do
expect(FarMar::Market.name[0]).must_equal("People's Co-op Farmers Market")
expect(FarMar::Market.zip(0).must_equal(97202))
end

it 'FarMar::Market.all must return all objects' do
  market = FarMar::Market.new(3, "Dolgeville Farmer's Market", "(Parking Lot) Between Main St. and Helmer Ave", "Dolgeville", "Herkimer", "New York", 13329)

expect(FarMar::Market.all[2]).must_be_same_as(market.inspect)
end

end #end of test
