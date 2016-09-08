require_relative '../far_mar'


class FarMar::Vendor


  attr_reader  :id, :name, :no_of_employees, :market_id

  def initialize(id, name, no_of_employees, market_id)
    @id = id
    @name = name
    @no_of_employees = no_of_employees
    @market_id = market_id
  end

  def self.all
    vendor_list = []
    CSV.open("./support/vendors.csv", 'r').each do |line|

      id = line[0].to_i
      name = line[1]
      no_of_employees = line[2].to_i
      market_id = line[3].to_i
      ven = FarMar::Vendor.new(id, name, no_of_employees, market_id)
      vendor_list << ven
    end
    return vendor_list
  end

  def self.by_market(market_id)
    mark_ven = []
    ven = self.all
    ven.each do |obj|
      if obj.market_id == market_id
        mark_ven << obj
      end
    end
    return mark_ven
  end

  def self.products(id)
    vendor_products = []
    thing = FarMar::Product.all
    thing.each do |obj|
      if obj.vendor_id == id
        vendor_products << obj.name
      end
    end
      return vendor_products
  end

  def self.market(market_id)
    vendor_market = []
    thing = FarMar::Market.all
    thing.each do |obj|
      if obj.id == market_id
        vendor_market<< obj
      end
    end
      return vendor_market
  end

  def self.sales(id)
    vendor_sale = []
    thing = FarMar::Sales.all
    thing.each do |obj|
      #puts obj.vendor_id.class
      if obj.vendor_id == id
        vendor_sale << obj.amount
      end
    end
      return vendor_sale
  end

  def self.revenue
    total = self.sales(50).inject { |result, element| result + element }
    return total
  end

end#end of class
print FarMar::Vendor.market(10)
#print FarMar::Vendor.products(48)
  #print FarMar::Vendor.by_market(9)
# self.by_market(market_id)
