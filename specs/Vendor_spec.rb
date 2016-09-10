require_relative 'spec_helper'
require_relative '../far_mar' # this is the module file


describe 'Test FarMar_Vendor.rb' do

it 'FarMar::Vendor must return an array' do
expect(FarMar::Vendor.all).must_be_instance_of(Array)
end

it 'FarMar::Vendor must return instance that is associated with this vendor' do
expect(FarMar::Vendor.market(10).name).must_equal("Saratoga Farmers' Market")
end

it 'FarMar::Product must return instances that are associated by the FarMar::Product vendor_id field.' do
expect(FarMar::Vendor.products(48)[1].to_s).must_include("Tight Bread")
end

it 'FarMar::Sale must return a collection of instances that are associated by the vendor_id field.' do
expect(FarMar::Vendor.sales(50)[0].amount).must_equal(4713)
end


it 'returns the the sum of all of the vendors sales (in cents)' do
expect(FarMar::Vendor.revenue).must_equal(62899270)
end

it 'FarMar::Vendor.by_market must return all of the vendors with the given market_id' do
  expect(FarMar::Vendor.by_market(8)[1].name).must_equal("Veum, Dickinson and Conroy")
end


end #end of test
