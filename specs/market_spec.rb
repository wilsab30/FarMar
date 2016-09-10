require_relative 'spec_helper'
require_relative '../far_mar' # this is the module file


describe 'Test Market.rb' do

it 'FarMar::Market must return an array' do
expect(FarMar::Market.all).must_be_instance_of(Array)
end

it 'FarMar::Market.all must return all objects' do
expect(FarMar::Market.all.length).must_equal(500)
end

it 'FarMar::Market must returns an instance of the object that matchesthe passed parameter.' do
expect(FarMar::Market.find(488).wont_be_nil(true))
end
it 'FarMar::Market must return object data' do
expect(FarMar::Market.name[0]).must_equal(FarMar::Market.name[0])
end

it 'FarMar::Market.all must return all objects' do
expect(FarMar::Market.all[2].name).must_include("Dolgeville Farmer's Market")
end

end #end of test
