

require 'rest-client'
require 'json'
require 'pry-byebug'


url = 'https://api.yelp.com/v3/businesses/WavvLdfdP6g8aZTtbBQHTw/reviews'

test = RestClient.get(url, headers={'Authorization': 'Bearer 2MylewUK6xe2HIBTOrHcV_WWkHW5DuUX18WUZuKS_dDMBO27gklYOYlNjDNBIlbhKqcuV3NJTLdiaK9h5CQstBPnWD287DG90nryz-3PWIu-MJh17_zXhCbk8sBiXHYx' })
byebug

p test

