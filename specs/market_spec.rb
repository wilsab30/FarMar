require_relative 'spec_helper'
require_relative '../far_mar' # this is the module file


describe 'Test Market.rb' do

it 'FarMar::Market must return an array' do
expect(FarMar::Market.all).must_be_instance_of(Array)
end

it 'FarMar::Market must return object' do
expect(FarMar::Market.find(488).wont_be_nil(true))
end
it 'FarMar::Market must return object' do
expect(FarMar::Market.vendors(1).wont_be_nil(true))
end

end #end of test
