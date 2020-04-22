#!/usr/bin/env ruby

require_relative '../lib/board'
require_relative '../lib/player'


class Game
  @players
  @current_player
  @board

  def initialize
    @players = []
    @current_player = 0
    set_players
    create_board
    start_session
  end

  private
  def set_players
    while Player.players.length < 2
      puts "Player #{Player.players.length + 1} enter your name: "
      name = gets.chomp
      Player.players << Player.new(name, get_character)
    end
  end

  private
  def get_character
    Player.players.empty? ? 'X' : 'O'
  end

  def create_board
    @board = Board.new
  end

  def start_session
    create_board
    while @board.has_moves?
      p @board.cells
      p "select your number to play"
      number = gets.chomp.to_i
      outcome = @board.move(number, Player.players[@current_player].character)
      if outcome === 1
        p "#{Player.players[@current_player].name} won!"
        break
      elsif outcome === -1
        p "cell #{number} is not available, try again"
      elsif outcome === 0
        p "its a tie!"
      else
        @current_player = @current_player == 1 ? 0 : 1
      end
    end
  end
end

Game.new

