require_relative '../far_mar'

class FarMar::Product
attr_reader  :id, :name, :vendor_id
  def initialize(id, name, vendor_id)
    @id = id
    @name = name
    @vendor_id = vendor_id
  end
#returns a collection of instances, representing all of the objects described in the product.csv file.
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


#returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  def self.find(id)
    prod = self.all
    prod.each do |obj|
      if obj.id == id
        return obj
      end
    end
  end


# returns the number of times this product has been sold.
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


# returns a collection of FarMar::Sale instances that are associated using the FarMar::Sale product_id field.
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


# returns the FarMar::Vendor instance that is associated with this vendor using the FarMar::Product vendor_id field
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
# returns all of the products with the given vendor_id
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
#print FarMar::Product.by_vendor(5)
#FarMar::Product.products
