class FundingRound

  @@all = [] 

  attr_reader :startup, :venture_capitalist, :type, :investment

  def initialize(attributes)
    @startup = attributes[:startup]
    @venture_capitalist = attributes[:venture_capitalist]
    @type = attributes[:type] 
    @investment = attributes[:investment]
    @@all << self 
  end

  def self.all 
    @@all 
  end 

end #end of FundingRound class 


