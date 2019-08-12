class VentureCapitalist

    attr_reader :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name =  name
        @total_worth = total_worth # should it be in the initializer? - and that's how we return it?
        @all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select do |vent_cap|
            vent_cap.total_worth > 1,000,000,000
        end
    end

end
