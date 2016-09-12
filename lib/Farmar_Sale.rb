require_relative '../far_mar'
require 'Date'

class FarMar::Sales
  attr_reader  :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = DateTime.parse(purchase_time)
      @vendor_id = vendor_id
      @product_id = product_id
    end


#returns a collection of instances, representing all of the objects described in the sales.csv file.
    def self.all
      sales_list = []
      CSV.open("./support/sales.csv", 'r').each do |line|

        id = line[0].to_i
        amount = line[1].to_i
        purchase_time = line[2]
        vendor_id = line[3].to_i
        product_id = line[4].to_i
        sale = FarMar::Sales.new(id, amount, purchase_time, vendor_id, product_id)
        sales_list << sale
      end
      return sales_list
    end


# returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
    def self.find(id)
      sale = self.all
      sale.each do |obj|
        if obj.id == id
          return obj
        end
      end
    end


# returns the FarMar::Vendor instance that is associated with this sale using the FarMar::Sale vendor_id field
    def self.vendor(vendor_id)
      sale_ven = nil
    ven = FarMar::Vendor.all
    ven.each do |obj|
      if obj.id == vendor_id
        sale_ven = obj
      end
    end
    return sale_ven
    end


# returns the FarMar::Product instance that is associated with this sale using the FarMar::Sale product_id field
    def self.product(product_id)
      sale_prod = nil
    ven = FarMar::Product.all
    ven.each do |obj|
      if obj.id == product_id
        sale_prod = obj
      end
    end
    return sale_prod

    end


# returns a collection of FarMar::Sale objects where the purchase time is between the two times given as arguments
    def self.between(beginning_time, end_time)
      beginning_time = DateTime.parse(beginning_time)
      end_time = DateTime.parse(end_time)
      sales = []
      record = self.all
      record.each do |sale|
        if sale.purchase_time >= beginning_time && sale.purchase_time <= end_time
          sales << sale
        end
        end
        return sales
    end

end#end of class

# puts sale_prod
# a1 = FarMar::Sales.between("2013-11-11 07:56:35 -0800", "2013-11-11 20:56:35 -0800")
# a1.each do |sale|
#   puts sale.purchase_time
# end
#print FarMar::Sales.all
#print FarMar::Sales.vendor(48)
