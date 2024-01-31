require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "What's your name bro ?"
name = gets.chomp
puts "Kk, how many guys do you wanna fight ?"
number = gets.chomp.to_i

new_game = Game.new(name, number)
while new_game.is_still_ongoing?
  new_game.extended_show_state
  puts ""
  new_game.menu
  user_answer = gets.chomp
  new_game.menu_choice(user_answer)
  new_game.enemies.each do |enemy|
    new_game.kill_player(enemy)
  end
  new_game.enemies_attack
end

new_game.end_game
