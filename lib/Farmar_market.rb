require_relative '../far_mar'



class FarMar::Market
  attr_reader  :id, :name, :address, :city, :state, :zip

  def initialize(id, name, address, city, county, state, zip)
    @id = id
    @name = name
    @address = address
    @city = city
    @state = state
    @zip = zip
  end

  def self.all
    market_list = []
    CSV.open("../support/markets.csv", 'r').each do |line|

      id = line[0].to_i
      name = line[1]
      address = line[2]
      city = line[3]
      county = line[4]
      state = line[5]
      zip = line[6]
      mkt = FarMar::Market.new(id, name, address, city, county, state, zip)

      market_list << mkt
    end
    return market_list
  end

  def self.find(id)
    mkt = self.all
    mkt.each do |obj|
      if obj.id == id
        return obj
      end
    end
  end

  # def vendors
  #
  # id = line[0].to_i
  # name = line[1]to_s
  # no_of_employees = [2].to_i
  # market_id = line[3].to_i
  #
  # end
end#end of class



print FarMar::Market.find(488)
