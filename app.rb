require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

p1 = Player.new("JoJo")
p2 = Player.new("Dio")

puts "HERE WE GO !! #{p1.name} vs #{p2.name}"
puts p1.show_state
puts p2.show_state
sleep(3)

puts "ATTAAAAAAAAAAACK !"
while p1.hp > 0 && p2.hp >= 0
    sleep(1)
    p2.attacks(p1)
    p1.show_state
    puts "\n"
    sleep(2)
    if p1.hp > 0
        sleep(1)
        p1.attacks(p2)
        p2.show_state
        puts "\n"
        sleep(2)
    end
end
binding.pry
