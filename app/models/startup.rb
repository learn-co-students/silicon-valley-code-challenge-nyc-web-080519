class Startup
    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founders_name)
        all.select do |startup|
            startup.founder == founders_name
        end
    end

    def self.domains
        all.map do |startup|
            startup.domain
        end
    end
end
