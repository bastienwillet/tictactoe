require_relative "main.rb"
require_relative "tictactoe_Board.rb"
require_relative "tictactoe_BoardCase.rb"
require_relative "tictactoe_Player.rb"
require_relative "tictactoe_Game.rb"

class Player																	# Initialise les joueurs
	attr_accessor :player_name, :player_symbol
	def initialize(name, symbol)
		@player_name = name
		@player_symbol = symbol
	end
end