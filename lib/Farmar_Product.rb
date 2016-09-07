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

  def self.by_vendor(vendor_id)
    product_by_ven = []
  vendor = FarMar::Vendor.all
  vendor.each do |obj|
    if obj.id == vendor_id
      product_by_ven << obj
      end
      return product_by_ven
    end
  end

end#end of class
print FarMar::Product.by_vendor(50)
#FarMar::Product.products
