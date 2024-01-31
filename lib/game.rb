require 'bundler'
Bundler.require

require_relative 'player'
require "pry"

class Game
  attr_accessor :human_player
  attr_accessor :enemies

  def initialize(name, number_of_enemies)
    @human_player = HumanPlayer.new(name)
    @enemies = []
    count = 1
    number_of_enemies.times do
      bot = Player.new("Bot #{count}")
      count += 1
      @enemies.push(bot)
    end
  end

  def kill_player(player)
    if player.hp <= 0
      @enemies.delete(player)
    end
  end
  
  def is_still_ongoing?
    if @human_player.hp > 0 && @enemies.length > 0
      return true
    else
      return false
    end
  end

  def menu
    puts "a - Pick up sum weapon ?"
    puts "h - u heal ?"
    puts "r - attack a random bot, gl"
  end

  def extended_show_state
    @human_player.show_state
    @enemies.each do |enemy|
      enemy.show_state
    end
  end

  def menu_choice(human_input)
    while human_input != "a" && human_input != "r" && human_input != "h"
      puts "Wrong choice man"
      human_input = gets.chomp
    end
    case human_input
      when "a"
          @human_player.getting_new_weapon
      when "h"
          @human_player.getting_heal
      when "r"
        puts "Throwing dice..."
        dice_num = rand(0..@enemies.length-1)
        sleep(2)
        @human_player.attacks(@enemies[dice_num])
      end
  end

  def enemies_attack
    puts "Those mfers are mad !!"
    puts " "
    puts " "
    @enemies.each do |enemy|
        if enemy.hp > 0 && @human_player.hp > 0
            enemy.attacks(@human_player)
            sleep(1)
            puts" "
        end
    end
  end

  def end_game
    if @human_player.hp > 0
      puts "Yeaaaaah baby"
    else
      puts "Lol boosted"
    end
  end
  

end

