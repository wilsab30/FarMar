require_relative 'spec_helper'
require_relative '../far_mar' # this is the module file


describe "testing product.rb" do

  it 'FarMar::Product.all must return an array' do
  expect(FarMar::Product.all).must_be_instance_of(Array)
  end

  it 'FarMar::Product.all must return all objects' do
  expect(FarMar::Product.all.length).must_equal(8193)
  end

  it 'FarMar::Product.vendor must return vendor instance that is associated with this sale' do
    expect(FarMar::Sales.vendor(48).name).must_equal("Greenfelder Inc")
  end

  it 'FarMar::Product.vendor must return vendor instance that is associated with this sale' do
    expect(FarMar::Sales.vendor(45).name).must_equal("Hyatt, Conroy and Ortiz")
  end

  it 'FarMar::Product.number_of_sales must return the number of times this product has been sold.' do
    bob = FarMar::Product.new(1, "Dry Beets", 1)
    expect(bob.number_of_sales).must_equal(7)
  end

  it 'FarMar::Sale.sale must return a collection of sales instances that are associated by prodduct_id' do
    bob = FarMar::Product.new(1, "Dry Beets", 1)
    expect(bob.sales[0].amount).must_equal(9290)
  end


it 'FarMar::Product.by_vendor must return returns all of the products with the given vendor_id' do
  expect(FarMar::Product.by_vendor(5)).must_equal(["Green Apples"])
end

it 'FarMar::Market must returns an instance of the object that matchesthe passed parameter.' do
expect(FarMar::Product.find(32).wont_be_nil(true))
end





end
