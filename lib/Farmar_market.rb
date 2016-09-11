require_relative '../far_mar'



class FarMar::Market
  attr_reader  :id, :name, :address, :city, :county, :state, :zip

  def initialize(id, name, address, city, county, state, zip)
    @id = id
    @name = name
    @address = address
    @city = city
    @county = county
    @state = state
    @zip = zip
  end
#returns a collection of instances, representing all of the objects described in the market.csv file.
  def self.all
    market_list = []
    CSV.open("./support/markets.csv", 'r').each do |line|

      id = line[0].to_i
      name = line[1]
      address = line[2]
      city = line[3]
      county = line[4]
      state = line[5]
      zip = line[6].to_i
      mkt = FarMar::Market.new(id, name, address, city, county, state, zip)

      market_list << mkt
    end
    return market_list
  end
# returns an instance of the object where the value of the id field in the CSV matches the passed parameter.
  def self.find(id)
    mkt = self.all
    mkt.each do |obj|
      if obj.id == id
        return obj
      end
    end
  end
# returns a collection of FarMar::Vendor instances that are associated with the market by the market_id field.
  def self.vendors(id)
    market_vendor = []
    vendor = FarMar::Vendor.all
    vendor.each do |obj|
      if obj.market_id == id
        market_vendor << obj
        end
        return market_vendor
      end
  end

end#end of class
#puts FarMar::Market.all.length
#FarMar::Market.vendors(10)
# puts market_vendor
