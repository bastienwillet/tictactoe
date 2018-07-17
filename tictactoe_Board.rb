require_relative "main.rb"
require_relative "tictactoe_Board.rb"
require_relative "tictactoe_BoardCase.rb"
require_relative "tictactoe_Player.rb"
require_relative "tictactoe_Game.rb"

class Board
	attr_accessor :board_cases
	def initialize																# Crée les BoardCases et les stocke dans un array board_cases
		@board_cases = []	
		for i in 0..8
			board_cases << BoardCase.new(" ")
		end
		show_board
	end

	def show_board																# Affiche le plateau
		puts "     1   2   3  "
		puts "   ╔═══╦═══╦═══╗"
		puts " A ║ #{board_cases[0].status} ║ #{board_cases[1].status} ║ #{board_cases[2].status} ║"
		puts "   ╠═══╬═══╬═══╣"
		puts " B ║ #{board_cases[3].status} ║ #{board_cases[4].status} ║ #{board_cases[5].status} ║"
		puts "   ╠═══╬═══╬═══╣"
		puts " C ║ #{board_cases[6].status} ║ #{board_cases[7].status} ║ #{board_cases[8].status} ║"
		puts "   ╚═══╩═══╩═══╝"
		puts ""
	end

	def case_define(case_number, player)										# Définit le statut d'une case
		board_cases[case_number].status = player.player_symbol
	end

	def case_check(case_number)													# Renvoie le statut d'une case
		board_cases[case_number].status
	end
end