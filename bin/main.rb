#!/usr/bin/env ruby

require_relative '../lib/board'
require_relative '../lib/player'


class Game
  @players = []
  @current_player = 0
  @board
# three classes that will be use are the Player class that stores user names
# assigns that to either player_1 or player_2 and validates names given by users

# Board classes that has the winning sequences
# the make up of the board, how the board will be displayed

# Game class with print all messages to the screen
# initialize the game and end the game
  def initialize player, board
    @player = player
    @board = board
  end

# Game class initializes the
# prints the introduction
# tell the users about the game
puts 'Hi! Welcome to play Tic Tac Toe'

# then Game class ask for the users name
puts 'Player 1 enter your name'
@player = gets.chomp
# the user input ins validated to ensure that the users enter a valid name
# if the player enters an invalid user name, Error message is displayed
puts 'Please enter a valid name of letters only no numbers'
# if player enters a valid name Games class creates an instances of the
# Players class and storing the 1st users names in player_1
# assigns the letter X to player_1

# then Game class ask for the second users name
puts 'Player 2 enter your name'
# the user input ins validated to ensure that the users enter a valid name
# if the player enters an invalid user name, Error message is displayed
puts 'Please enter a valid name of letters only no numbers'
# if player enters a valid name Games class creates an instances of the
# Players class and storing the 1st users names in player_1
# assigns letter 0 to player_2

# then the Games class displays the games board to the screen with numbered squares 0 - 8
until gameover || draw
  # loop following actions until there is a winner or draw/tie
  # ask user that is player_1 to choose a number
  puts 'Player_1 choose your number'
  # checks that the number Player one selected is available 0 - 8
  # if number selected by player one is not valid/in range 0 - 8
  # prompt player_1 to choose a valid number 0 - 8
  # if it is available 0 - 8, gets player_1's number
  # replaces the number with an X
  # remove number chosen from valid numbers
  #
  # ask user that is player_2 to choose a number
  puts 'Player_2 choose your number'
  # checks that the number Player_2 one selected is available 0 - 8 minus player_1's choice
  # if number selected by player_2 one is not valid/in range 0 - 8 minus player_1's choice
  # prompt player_1 to choose a valid number 0 - 8 minus player_1's choice
  # if number selected by player_2 is a number already chosen
  # prompt player_2 that that number was already chosen please
  # if it is available 0 - 8, gets player_1's number
  # replaces the number with an X
  # removes number from valid numbers
  #
  # check board after every players moves and compares it to a array with all possible
  # winning sequences
  # repeat steps above until there's a winner or no more moves
  puts 'Game over!'
  # if there is no more available numbers in valid numbers and no match to any winning sequences
  # break out of loop
  # prompt users that the games resulted to a draw
  puts 'Game eneded in a Draw!'
  #  if after a user had selected a valid number from remaining valid numbers
  #  and matched a winning sequence from winning sequences prompt that that
  #  break out of loop
  #  player won the game
  puts 'Winner is Player!'
end
end

