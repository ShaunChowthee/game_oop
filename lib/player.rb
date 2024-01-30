require "pry"

class Player
    attr_accessor :name
    attr_accessor :hp

    def initialize(name, hp = 10)
        @name = name
        @hp = hp
    end

    def show_state
        if @hp >0
            puts "#{@name} has #{@hp} hp"
        end
    end

    def gets_damaged(damage)
        @hp = @hp - damage
        if self.hp <= 0
            puts "#{@name} has been slain"
        else
            puts "#{@name} took #{damage} damage"
        end
    end
    
    def compute_dmg
        return rand(1..6)
    end

    def attacks(target)
        atk_value = compute_dmg
        puts "#{self.name} attacks #{target.name}"
        target.gets_damaged(atk_value)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name, hp=100, weapon_level=1)
        @weapon_level = weapon_level
        super(name, hp)
    end

    def show_state
        if self.hp > 0
            if self.hp > 100
                self.hp = 100
            end
            puts "#{name} has #{hp} hp and his weapon is at level #{weapon_level}"
        end
    end

    def compute_dmg
        return rand(1..6) * @weapon_level
    end

    def getting_new_weapon
        new_weapon_value = rand(1..6)
        if new_weapon_value > @weapon_level
            @weapon_level = new_weapon_value
            puts "Weapon is now level #{@weapon_level}"
        else
            puts "hMMM...."
        end
    end

    def getting_heal
        dice_value = rand(1..6)
        if dice_value == 1
            puts "Nothing found"
        elsif dice_value == 6
            puts "+80 hp bro !"
            self.hp = self.hp + 80
        else
            puts "noice +50 hp"
            self.hp = self.hp + 50
        end
    end    
end
