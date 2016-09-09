require_relative 'spec_helper'
require_relative '../far_mar' # this is the module file


describe 'Test FarMar_Vendor.rb' do

it 'FarMar::Vendor must return an array' do
expect(FarMar::Sales.all).must_be_instance_of(Array)
end

it 'FarMar::Sales.vendor must return vendor instance that is associated with this sale' do
expect(FarMar::Sales.vendor(48).name).must_equal("Greenfelder Inc")
end

it 'FarMar::Sales.vendor must return vendor instance that is associated with this sale' do
expect(FarMar::Sales.product(84).name).must_equal("Hushed Honey")
end














end #end of test
