require_relative '../far_mar'

class FarMar::Product
attr_reader  :id, :name, :vendor_id
  def initialize(id, name, vendor_id)
    @id = id
    @name = name
    @vendor_id = vendor_id
  end

  def self.all
    product_list = []
    CSV.open("./support/products.csv", 'r').each do |line|
      id = line[0].to_i
      name = line[1]
      vendor_id = line[2].to_i
      prod = FarMar::Product.new(id, name, vendor_id)
      product_list << prod
    end
    return product_list
  end

  def self.find(id)
    prod = self.all
    prod.each do |obj|
      if obj.id == id
        return obj
      end
    end
  end

   def number_of_sales
     num_sales = 0
     records = FarMar::Sales.all
     records.each do |sale|
       if sale.product_id == id
         num_sales += 1
       end
    end
    return num_sales
   end

def sales
  prod_sales = []
  sales = FarMar::Sales.all
  sales.each do |sale|
    if sale.product_id == id
    prod_sales << sale
    end
  end
  return prod_sales
end

   def self.vendor(vendor_id)
     prod_ven = nil
   ven = FarMar::Vendor.all
   ven.each do |obj|
     if obj.id == vendor_id
       prod_ven = obj
     end
   end
   return prod_ven
   end

  def self.by_vendor(vendor_id)
    product_by_ven = []
  product = self.all
  #puts product
  product.each do |obj|
    if obj.id == vendor_id
      product_by_ven << obj.name
      end
  end
  return product_by_ven
  end

end#end of class
print FarMar::Product.by_vendor(5)
#FarMar::Product.products
