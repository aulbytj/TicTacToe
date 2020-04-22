#!/usr/bin/env ruby

require_relative '../lib/game'
require_relative '../lib/board'

players = []

def player_move(player, board)
  show_board(board)
  p "#{player.name} select a number to make move"
  gets.chomp.to_i
end

def show_board(board)
  board.each { |row| p row }
end

while players.length < 2
  p "Player #{players.length + 1} enter your name: "
  name = gets.chomp
  if !name.empty?
    players << name
  else
    p 'invalid name entered'
  end
end

game = Game.new(players)
move = 0
status = ''

while move < 1
  move = game.make_move(player_move(game.player, game.board))
  if move == -1
    p 'invalid cell selected'
    move = 0
  elsif move == 1
    status = "#{game.player.name} won!"
    break
  else
    status = 'Its a tie!'
  end
end

p status
