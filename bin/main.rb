#!/usr/bin/env ruby

require_relative('../lib/game')
require_relative('../lib/board')

players = []

def input
  gets.chomp
end

while players.length < 2
  p("Player #{players.length + 1} enter your name: ")
  name = gets.chomp
  if !name.empty?
    players << name
  else
    p('invalid name entered')
  end
end

game = Game.new(players)
move = 0
status = ''

while move < 1
  puts(game.board)
  p("#{game.player.name} select a number to make move")
  move = game.make_move(input)
  if move == -1
    p('invalid cell selected')
    move = 0
  elsif move == 1
    status = "#{game.player.name} won!"
    break
  elsif move == -2
    status = 'Its a tie!'
    break
  end
end

puts(game.board)
p(status)
