require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("WeWork", "Adam N.", "Real Estate")
s2 = Startup.new("Uber", "Avery Z.", "Transportation")
s3 = Startup.new("Etsy", "Sheila W.", "Craft Services")

v1 = VentureCapitalist.new("Stuart B.", 10000000000)
v2 = VentureCapitalist.new("Grandma Y.", 60000000)
v3 = VentureCapitalist.new("Chewbacca", 40000000000)

fr1 = FundingRound.new(s1, v1, "Round B", 40.0)
fr2 = FundingRound.new(s1, v2, "Round B", 150.0)
fr3 = FundingRound.new(s2, v1, "Round A", 65.0)
fr4 = FundingRound.new(s3, v3, "Round B", 600000.0)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line