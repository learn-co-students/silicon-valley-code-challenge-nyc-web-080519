class Startup
    attr_reader :founder, :domain
    attr_accessor :name
    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @name = name
        @domain = domain
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder)
        self.all.find do |startup|
            startup.founder == founder
        end
    end

    def self.domains
        self.all.map do |startup|
            startup.domain
        end
    end

    def sign_contract(vc, investment_type, amount)
        FundingRound.new(self, vc,investment_type, amount)
    end

    #helper function returning an error of all of my funding rounds
    def my_funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.startup == self
        end
    end

    def num_funding_rounds
        self.my_funding_rounds.count
    end

    def total_funds
        self.my_funding_rounds.sum do |funding_round|
            funding_round.investment
        end
    end

    def investors
        self.my_funding_rounds.map do |funding_round|
            funding_round.venture_capitalist
        end.uniq
    end

    def big_investors
        self.investors.select do |investor|
            VentureCapitalist.tres_commas_club.include?(investor)
        end
    end

    private
    attr_writer :domain
end
