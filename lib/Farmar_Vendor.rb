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

  def self.find(id)
    ven = self.all
    ven.each do |obj|
      if obj.id == id
        return obj
      end
    end
  end

  def products
  end

    def vendors

  end
end
  #print FarMar::Vendor.find(1).name
  # #market
  # #
  # #sales
  # #revenue
  # self.by_market(market_id)
