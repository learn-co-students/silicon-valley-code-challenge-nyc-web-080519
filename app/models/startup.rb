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
    
end
