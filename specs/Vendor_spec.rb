require_relative 'spec_helper'
require_relative '../far_mar' # this is the module file

describe 'Test Market.rb' do

it 'FarMar::Market must return an array' do
expect(FarMar::Vendor.all).must_be_instance_of(Array)
end

it 'FarMar::Market must return object' do
expect(FarMar::Vendor.find(488).wont_be_nil(true))
end
it 'FarMar::Market must return array' do
expect(FarMar::Vendor.vendor.wont_be_nil(true))
end
returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field

returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.

returns a collection of FarMar::Sale instances that are associated by the vendor_id field.

returns the the sum of all of the vendors sales (in cents)

returns all of the vendors with the given market_id

end #end of test
