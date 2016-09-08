

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

print FarMar::Vendor.products(48)
#print FarMar::Vendor.sales(50)
#print FarMar::Vendor.revenue
# ...require all needed classes
