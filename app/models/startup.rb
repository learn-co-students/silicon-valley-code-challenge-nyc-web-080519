class Startup

  @@all = []

  attr_accessor :name, :domain
  attr_reader :founder 

  def initialize(attributes)
    @name = attributes[:name] 
    @founder = attributes[:founder] 
    @domain = attributes[:domain]
    @@all << self 
  end

  def self.all 
    @@all 
  end

  def pivot(domain, name)
    @name = name 
    @domain = domain 
  end

  def self.find_by_founder(founder_name)
    self.all.find do |startup|
      startup.founder == founder_name
    end
  end 

  def self.domains
    self.all.map do |startup|
      startup.domain
    end
  end

  def sign_contract(vc_obj, investment_type, inv_amount)
    newFundingRound = FundingRound.new({
      startup: self, 
      venture_capitalist: vc_obj, 
      type: investment_type, 
      investment: inv_amount.to_f 
    }) 
  end 

  def num_funding_rounds
    FundingRound.all.select {|round| round.startup == self}.count
  end

  def total_funds
    total = 0 
    FundingRound.all.each do |round| 
      total += round.investment 
    end
    total
  end

  #Returns a unique array of all the venture capitalists that have invested in this company
  def investors 
    #traverse through all the rounds and identify the rounds related to this startup
    #traverse through the rounds and identify the investors 
    #return a unique array 
    funding_rounds = FundingRound.all.select do |round|
      round.startup == self 
    end
    our_investors = funding_rounds.map do |round|   
      round.venture_capitalist
    end
    our_investors.uniq
  end

  #Returns a unique array of all the venture capitalists that have invested in this company and are in the Trés Commas club

  def big_investors
    #traverse through all the tres commas club investors and select out investors that match ours
    tres_comma_investors = [] 
    VentureCapitalist.tres_commas_club.each do |vc|
      self.investors.each do |investor|
        investor == vc
        tres_comma_investors << investor 
      end 
    tres_comma_investors.uniq 
    end
    
  end 


end #end of Startup class
