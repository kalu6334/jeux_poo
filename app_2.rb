require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

puts "-----------------------------------------------------"
puts "| Bienvenue sur 'IlS VEULENT TOUS MA POO' !         |"
puts "| Le but du jeu est d'être le dernier survivant !   |"
puts "-----------------------------------------------------"

puts "Quel est ton prénom ? "  
user = HumanPlayer.new("#{gets.chomp}")
player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1,player2]

while user.life_point > 0 && (player1.life_point > 0 || player2.life_point > 0 )
    puts user.show_state
    puts "Quelle action veux-tu effectuer ?"
    puts
    puts " a - chercher une meilleure arme "
    puts " s - chercher à se soigner "
    puts 
    puts "attaquer un joueur en vue :"
    print " 0 - " 
    puts player1.show_state
    print " 1 - " 
    puts player2.show_state
    user_choix = gets.chomp
    if user_choix == "a"
        user.search_weapon
    elsif user_choix == "s"
        user.search_health_pack
    elsif user_choix == "0"
        user.attacks(player1)
    elsif user_choix == "1" 
        user.attacks(player2)
    end
    puts "les autres joueurs t'attaquent !"
    if player1.life_point > 0 
    player1.attacks(user)
    elsif player2.life_point > 0
    player2.attacks(user)
    end
    
end
puts "La partie est finie"
if user.life_point > 0
    puts "BRAVO ! TU AS GAGNE !"
elsif user.life_point <= 0
    puts "Loser ! Tu as perdu !"
end