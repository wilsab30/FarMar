require_relative '../far_mar'


class FarMar::Vendor


  attr_reader  :id, :name, :no_of_employees, :market_id

  def initialize(id, name, no_of_employees, market_id)
    @id = id
    @name = name
    @no_of_employees = no_of_employees
    @market_id = market_id
  end
#returns a collection of instances, representing all of the objects described in the vendor.csv file.
  def self.all
    vendor_list = []
    CSV.open("./support/vendors.csv", 'r').each do |line|

      id = line[0].to_i
      name = line[1].to_s
      no_of_employees = line[2].to_i
      market_id = line[3].to_i
      ven = FarMar::Vendor.new(id, name, no_of_employees, market_id)
      vendor_list << ven
    end
    return vendor_list
  end


# returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  def self.find(id)
    ven = self.all
    ven.each do |obj|
      if obj.id == id
        return obj
      end
    end
  end


# returns all of the vendors with the given market_id
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


# returns a collection of FarMar::Product instances that are associated by the FarMar::Product vendor_id field.
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


# returns the FarMar::Market instance that is associated with this vendor using the FarMar::Vendor market_id field
  def self.market(market_id)
    vendor_market = nil
    thing = FarMar::Market.all
    thing.each do |obj|
      if obj.id == market_id
        vendor_market = obj
        break
      end
    end
      return vendor_market
  end


# returns a collection of FarMar::Sale instances that are associated by the vendor_id field.
  def self.sales(id)
    @vendor_sale  ||= []

    return @vendor_sale unless @vendor_sale.empty?
    thing = FarMar::Sales.all
    thing.each do |obj|
      #puts obj.vendor_id.class
      if obj.vendor_id == id
        @vendor_sale << obj
        end
      end
      return @vendor_sale
  end

  # def add_sale(sale)
  #   @vendor_sale << sale
  #
  # end

  
# returns the the sum of all of the vendor's sales (in cents)
  def self.revenue
    #puts @sale_amounts
    #calls sales, return an array of sale objects
    @amounts = []
    sale = FarMar::Sales.all
     sale.each do |obj|
       @amounts << obj.amount
    end
     total =  @amounts.inject { |result, element| result + element }
     total * 100
    return total
  end

end#end of class
#print FarMar::Vendor.revenue
#print FarMar::Vendor.market(10)
#print FarMar::Vendor.products(48)
  #print FarMar::Vendor.by_market(9)
