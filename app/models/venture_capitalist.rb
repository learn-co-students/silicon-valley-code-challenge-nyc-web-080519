class VentureCapitalist

  @@all = []

  attr_reader :name, :total_worth

  def initialize(attributes)
    @name = attributes[:name]
    @total_worth = attributes[:total_worth]
    @@all << self 
  end

  def self.all 
    @@all 
  end 

  def self.tres_commas_club
    self.all.select do |vc|
      vc.total_worth > 1000000000
    end
  end 

  def offer_contract(startup, investment_type, amount)
    newRound = FundingRound.new({
      startup: startup,
      venture_capitalist: self,
      type: investment_type,
      investment: amount
    })
  end

  def funding_rounds
    FundingRound.all.select do |round|
      round.venture_capitalist == self 
    end
  end

  def portfolio
    #identify the unique rounds to this VC
    #go through rounds and identify startups 
    #return unique list 
    self.funding_rounds.map do |round|
      round.startup
    end.uniq
  end

  #largest funding round
  def biggest_investment 
    inv_arr = self.funding_rounds.map do |round|
      round.investment
    end
    sorted_arr = inv_arr.sort{|a,b| b <=> a}
    sorted_arr[0]
  end

  #returns total amt invested in the domain
  def invested(domain)
    #identify unique rounds to this vc
    #go through my startups and identify the domain 
    #if domain string == the startup domain, return the startup investment 
    myStartupRound = FundingRound.all.select do |round|
      round.startup.domain == domain
    end
    myInvestment = myStartupRound.map do |round|
      round.investment
    end
    myInvestment.sum
  end

  

end #end of VentureCapitalist class
