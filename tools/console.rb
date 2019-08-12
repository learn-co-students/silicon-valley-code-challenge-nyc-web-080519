require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("My Startup", "Larry", "socks")
startup2 = Startup.new("Another startup", "Steve", "food")
startup3 = Startup.new("blah", "Joe", "tech")

vc1 = VentureCapitalist.new("Amy", 1000000000)
vc2 = VentureCapitalist.new("Bob", 800000)
vc3 = VentureCapitalist.new("John Smith", 50000000000000)

fr1 = FundingRound.new(startup1, vc1, "seed", 100000)
fr2 = FundingRound.new(startup1, vc2, "series a", 500000)
fr3 = FundingRound.new(startup2, vc3, "angel", 1000000)
fr4 = FundingRound.new(startup3, vc3, "angel", 7000000)
fr5 = FundingRound.new(startup1, vc1, "series b", 2500)


binding.pry
#leave this here to ensure binding.pry isn't the last line