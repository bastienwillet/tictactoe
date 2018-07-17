require_relative "main.rb"
require_relative "tictactoe_Board.rb"
require_relative "tictactoe_BoardCase.rb"
require_relative "tictactoe_Player.rb"
require_relative "tictactoe_Game.rb"

class BoardCase
	attr_accessor :status
	def initialize(status)														# Initialise une case
		@status = status
	end
end