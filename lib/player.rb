

class Player 
    attr_accessor :name, :life_point

    def initialize(name)
        @name = name
        @life_point = 10
    end

    def show_state
        puts "#{@name} a #{@life_point} point de vie"
    end

    def gets_domage(nombre)
        @life_point = @life_point - nombre
        if @life_point <= 0
            puts "le joueur #{@name} a été tué !"
        end
    end

    def attacks(player)
        puts " #{self.name} attaque  #{player.name}"
        degats = compute_damage     
        puts "il/elle lui inflige #{degats} points de dommages" 
        player.gets_domage(degats)
    end
 
    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name)
        @name = name
        @weapon_level = 1
        @life_point = 100
    end

    def show_state
        puts "#{@name} a #{@life_point} point de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon 
        dé = rand(1..6)
        puts "Tu a trouvé une arme de niveau #{dé}"
        if dé > @weapon_level 
            @weapon_level = dé 
            puts "Youhou ! elle est meilleure que ton arme actuelle: tu la prends."
        elsif dé <= @weapon_level
            puts "M@*#$...elle n'est pas mieux que ton arme actuelle ..."
        end
    end

    def search_health_pack 
        dée = rand(1..6)
        if dée == 0
            puts "tu n'a rien trouvé ..."
        elsif dée >=2 || dée <= 5
            @life_point = @life_point + 50
            if @life_point > 100
                @life_point = 100
            end
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        elsif dée == 6
            @life_point = @life_point + 80
            if @life_point > 100
                @life_point = 100
            end
            puts "Waouw, tu as trouvé un pack de +80 points de vie !"
        end
    end


end 