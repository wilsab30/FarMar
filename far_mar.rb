

# gems your project needs
require 'csv'

# our namespace module
module FarMar
end

# all of our data classes that live in the module
require_relative 'lib/Farmar_market'
require_relative 'lib/farmar_Vendor'
require_relative 'lib/farmar_Product'
require_relative 'lib/farmar_Sale'

#bob = FarMar::Product.new(1, "Dry Beets", 1)
#print bob.sales[0].amount
#print FarMar::Sales.vendor(48)
#print FarMar::Sales.product(164)
#print FarMar::Vendor.market(10)
#print FarMar::Vendor.products(48)
#FarMar::Vendor.sales(50)
#print FarMar::Vendor.revenue
# ...require all needed classes
