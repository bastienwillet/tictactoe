require_relative "main.rb"
require_relative "tictactoe_Board.rb"
require_relative "tictactoe_BoardCase.rb"
require_relative "tictactoe_Player.rb"
require_relative "tictactoe_Game.rb"

class Game
	attr_accessor :board, :game
	def initialize																# Demande les prénoms et symboles des joueurs et les créée (avec un détrompeur
		puts "Quel est le nom du premier joueur ?"								# pour éviter que les deux joueurs aient le même nom les symboles incorrects,
		print ">"																# que les symboles soient les mêmes, que les symboles aient plus d'un caractère
		temp1 = gets.chomp.to_s
		puts "Quel est le symbole du premier joueur ?"
		print ">"
		temp2 = gets.chomp.to_s
		while temp2.size > 1
			puts "Symbole incorrect, un seul caractère autorisé. Saisis un autre caractère"
			print ">"
			temp2 = gets.chomp.to_s
		end
		@player1 = Player.new(temp1, temp2)
		puts "Quel est le nom du deuxième joueur ?"
		print ">"
		while true
			temp1 = gets.chomp.to_s
			if temp1 == @player1.player_name
				puts "Nom déjà utilisé. Saisis un autre nom"
				print ">"
			else
				break
			end
		end
		puts "Quel est le symbole du premier joueur ?"
		print ">"
		while true
			temp2 = gets.chomp.to_s
			if temp2.size > 1
				puts "Symbole incorrect, un seul caractère autorisé. Saisis un autre caractère"
				print ">"
			else
				if temp2 == @player1.player_symbol
					puts "Symbole déjà utilisé. Saisis un autre caractère"
					print ">"
				else
					break
				end
			end
		end
		@player2 = Player.new(temp1, temp2)
		puts ""
		puts "#{@player1.player_name} a les #{@player1.player_symbol}"
		puts "#{@player2.player_name} a les #{@player2.player_symbol}"
		puts ""

		@board = Board.new														# Crée la board
		play 																	# Lance le jeu
	end

	def play 																	# SEQUENCE JEU : joueur 1 joue, la board s'affiche, checke si il a gagné
		loop do 																# puis pareil sur le deuxième joueur à l'infini
			tick(@player1)
			@board.show_board
			game_status
			tick(@player2)
			@board.show_board
			game_status
		end
	end

	def tick(player)															# SEQUENCE PLACAGE DE PION
		puts "#{player.player_name}, quelle case cocher ? (exemple : A1)"
		print ">"
		while true
			temp = gets.chomp
			if temp == "A1" then case_to_tick = 0								# Transforme l'emplacement saisi en emplacement dans l'array d'instances de BoardCase
			elsif temp == "A2" then case_to_tick = 1
			elsif temp == "A3" then case_to_tick = 2
			elsif temp == "B1" then case_to_tick = 3
			elsif temp == "B2" then case_to_tick = 4
			elsif temp == "B3" then case_to_tick = 5
			elsif temp == "C1" then case_to_tick = 6
			elsif temp == "C2" then case_to_tick = 7
			elsif temp == "C3" then case_to_tick = 8
			else case_to_tick = 10
			end
			if case_to_tick < 0 || case_to_tick > 8								# Vérifie que la valeur saisie correspond à un emplacement réel sur le plateau
				puts ""
				puts "#{player.player_name}, cette case n'existe pas. Choisis une case qui existe"
				print ">"
			else
				if board.case_check(case_to_tick) != " "						# Vérifie que l'emplacement sur le plateau est vide
					puts ""
					puts "#{player.player_name}, la case est déjà cochée. Choisis une autre case"
					print ">"
				else
					break
				end
			end
		end
		board.case_define(case_to_tick, player)									# Place le pion
	end

	def game_status																# Checke si gagne
		line1 = [board.case_check(0), board.case_check(1), board.case_check(2)]
		line2 = [board.case_check(3), board.case_check(4), board.case_check(5)]
		line3 = [board.case_check(6), board.case_check(7), board.case_check(8)]
		row1 = [board.case_check(0), board.case_check(3), board.case_check(6)]
		row2 = [board.case_check(1), board.case_check(4), board.case_check(7)]
		row3 = [board.case_check(2), board.case_check(5), board.case_check(8)]
		oblique1 = [board.case_check(0), board.case_check(4), board.case_check(8)]
		oblique2 = [board.case_check(2), board.case_check(4), board.case_check(6)]
		s1 = @player1.player_symbol
		s2 = @player2.player_symbol
		if line1 == [s1, s1, s1] || line2 == [s1, s1, s1] || line3 == [s1, s1, s1] || row1 == [s1, s1, s1] || row2 == [s1, s1, s1] || row3 == [s1, s1, s1] || oblique1 == [s1, s1, s1] || oblique2 == [s1, s1, s1]
			abort("#{@player1.player_name} WIIIIIIIIINS")
		elsif line1 == [s2, s2, s2] || line2 == [s2, s2, s2] || line3 == [s2, s2, s2] || row1 == [s2, s2, s2] || row2 == [s2, s2, s2] || row3 == [s2, s2, s2] || oblique1 == [s2, s2, s2] || oblique2 == [s2, s2, s2]
			abort("#{@player2.player_name} WIIIIIIIIINS")
		end

		count = 0																# Checke si match nul en comptant le nombre de cases occupées
		for i in 0..8
			if board.case_check(i) != " "
				count = count + 1
			end
		end
		if count >= 9
			abort("Match nul")
		end
	end
end