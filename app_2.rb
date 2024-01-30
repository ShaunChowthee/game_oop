require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

moi = HumanPlayer.new("Shaaaaauuuun")
enemies = [
cpu1 = Player.new("JoJo"),
cpu2 = Player.new("Dio")
]

while moi.hp > 0 && (cpu1.hp >0 || cpu2.hp >0)
    moi.show_state
    puts "Whatcha gonna do ?"
    puts "a - Pick up sum weapon ?"
    puts "h - u heal ?"
    puts "j - We go on JoJo ?"
    cpu1.show_state
    puts "d - or Dio is better ?"
    cpu2.show_state
    human_input = gets.chomp
    if human_input == "a"
        moi.getting_new_weapon
    end
    if human_input == "h"
        moi.getting_heal
    end
    if human_input == "j"
        moi.attacks(cpu1)
    end
    if human_input == "d"
        moi.attacks(cpu2)
    end
    sleep(3)
    puts " "
    puts " "  
    puts "Those mfers are mad !!"
    puts " "
    puts " "
    enemies.each do |enemy|
        if enemy.hp > 0 && moi.hp > 0
            enemy.attacks(moi)
            sleep(2)
            puts" "
        end
    end
end

if moi.hp > 0
    puts "Yeaaaaah baby"
else
    puts "Lol boosted"
end
