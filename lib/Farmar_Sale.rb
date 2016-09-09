require_relative '../far_mar'

class FarMar::Sales
  attr_reader  :id, :amount, :purchase_time, :vendor_id, :product_id
    def initialize(id, amount, purchase_time, vendor_id, product_id)
      @id = id
      @amount = amount
      @purchase_time = purchase_time
      @vendor_id = vendor_id
      @product_id = product_id
    end

    def self.all
      sales_list = []
      CSV.open("./support/sales.csv", 'r').each do |line|

        id = line[0].to_i
        amount = line[1].to_i
        purchase_time = line[2].to_i
        vendor_id = line[3].to_i
        product_id = line[4].to_i
        sale = FarMar::Sales.new(id, amount, purchase_time, vendor_id, product_id)

        sales_list << sale
      end
      return sales_list
    end

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

    # def self.between(beginning_time, end_time)
    # end
end
#print FarMar::Sales.all
#print FarMar::Sales.vendor(48)
