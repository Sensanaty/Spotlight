require 'koala'
require 'pry-byebug'


@graph = Koala::Facebook::API.new("EAAkVB5flX3cBABPZCzfHkJFYefRHjEcurAvCQR70Ty9YbdLQYeVzQx3gOLXCt3hg4hQo2Fsi5M2PEab9tuoEI7UqZAZC20S4Re5KBmolo78WjiVZBn0oZARhvZBc8JjUgPNXBZBzJ6KEUjwthLw0qfnEm1ECAHJ8uAVVeADZAi2L6wZDZD")
profile = @graph.get_object("me")
p "My name = #{profile["name"]}"

p tablevibe = @graph.get_object("104485937669806")

# object = @graph.get_object("facebook")

# user_graph.get_connections('me','accounts')

something = 2
