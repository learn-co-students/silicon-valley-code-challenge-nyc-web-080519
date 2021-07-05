class FundingRound

    attr_reader :startup, :venture_capitalist, :type, :investment

    @@all = []

    def initialize(venture_capitalist, startup, type, investment)
        @venture_capitalist = venture_capitalist
        @startup = startup
        @type = type
        @investment = investment
        @@all << self
    end

    # should the type & investment

    def self.all
        @@all
    end

end
