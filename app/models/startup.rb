class Startup

    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name =  name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(new_domain, new_name)
        self.domain = new_domain
        self.name = new_name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        self.all.find do |startup|
            startup.founder == founder_name
        end
    end

    def self.domains
        self.all.map do |startup| # select / map? - or either? map can work here, gets all unique and new array 
            startup.domain.uniq()
        end
    end

    # Associations and Aggregate Methods start below
    
    def sign_contract(venture_capitalist, type_of_investment, amount_invested)
        # below the number of parameters don't match the ones in the funding_round.rb class
        # see how you can fix it or what the logic is
        fundingRound = FundingRound.new(venture_capitalist, type_of_investment,amount_invested)
    
    end

    def num_funding_rounds
        # count the object in the array --- done below (correctly?)
        self.sign_contract.count # count the number of objects of funding_rounds, is this the correct way to do it?
    end

    def total_funds
        total_sum_investments = self.sign_contract.all.each do |investment_contract|
                                investment_contract.amount_invested
        end
    end

    def investors

    end

    def big_investors

    end


end
