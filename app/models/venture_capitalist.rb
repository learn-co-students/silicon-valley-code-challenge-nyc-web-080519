require "pry"

class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
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

    def offer_contract(startup, type_investment, amount)
        FundingRound.new(startup, self, type_investment, amount)
    end

    def funding_rounds
        FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
    end

    def portfolio
        self.funding_rounds.map do |funding_round|
            funding_round.startup
        end.uniq
    end

    def biggest_investment
        self.funding_rounds.max_by do |funding_round|
            funding_round.investment
        end
    end

    def invested(domain)
        my_funding_round_for_this_domain = self.funding_rounds.select do |funding_round|
            funding_round.startup.domain == domain
        end

        my_funding_round_for_this_domain.sum do |funding_round|
            funding_round.investment
        end
    end
end
