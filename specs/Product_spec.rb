require_relative 'spec_helper'
require_relative '../far_mar' # this is the module file


describe "testing product.rb" do


  it 'returns the number of times this product has been sold' do

  end

  it 'FarMar::Product.vendor must return vendor instance that is associated with this sale' do
    expect(FarMar::Sales.vendor(48).name).must_equal("Greenfelder Inc")
  end

  it 'FarMar::Product.vendor must return vendor instance that is associated with this sale' do
    expect(FarMar::Sales.vendor(45).name).must_equal("Hyatt, Conroy and Ortiz")
  end












end
