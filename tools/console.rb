require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

v1 = VentureCapitalist.new({name: "Bill", total_worth: 100000000000})
v2 = VentureCapitalist.new({name: "Megan", total_worth: 5000})
v3 = VentureCapitalist.new({name: "Josh", total_worth: 11000000000})

s1 = Startup.new({
  name: "Fiscalnote", 
  founder: "Tim", 
  domain: "fiscalnote.com"})
s2 = Startup.new({
  name:"Airbnb", 
  founder: "julie", 
  domain: "airbnb.com"})
s3 = Startup.new({
  name: "Tesla", 
  founder: "Elon", 
  domain: "tesla.com"})
s4 = Startup.new({
  name: "Domio", 
  founder: "adrian", 
  domain: "domio.com"})



f1=FundingRound.new({
  startup: s1,
  venture_capitalist: v2,
  type: "Series A", 
  investment: 1000 
})

f2=FundingRound.new({
  startup: s2,
  venture_capitalist: v3,
  type: "Series B", 
  investment: 5000 
})

f3=FundingRound.new({
  startup: s1,
  venture_capitalist: v1,
  type: "Series C", 
  investment: 100000
})

f3=FundingRound.new({
  startup: s1,
  venture_capitalist: v1,
  type: "Series C", 
  investment: 10000 
})



binding.pry
0 #leave this here to ensure binding.pry isn't the last line