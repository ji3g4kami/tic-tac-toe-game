#! /usr/bin/env ruby
board = [" ", " ", " ", " ", " ", " ", " ", " ", " ", " "]
instruction = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]


def print_board(board=[])
	formatter = " %{L} | %{M} | %{R} "
	puts formatter % {L: board[1], M: board[2], R: board[3]}
	puts "-"*11
	puts formatter % {L: board[4], M: board[5], R: board[6]}
	puts "-"*11
	puts formatter % {L: board[7], M: board[8], R: board[9]}
end

def input_validation(fill, board=[])
	if fill % 1 != 0
		if fill.to_i <=9 and fill.to_i >= 1 
			if board[fill.to_i] == ' '
				return true
			else
				puts "This place is not empty. Please enter an empty space:"	
			end
		else
			puts "Out of range."
		end
	else
		print "Invalid input. Please enter an empty space."
		return false
	end
end

# TODO: Check who wins the game
def check_winner(n, board=[])
	if board[n] == 'O'
		print_board(board)
		print "Player 1 wins the game!"
		exit()
	elsif board[n] == 'X'
		print_board(board)
		print "Player 2 wins the game!"
		exit()
	end
end

def check_result(board=[])
	if board[1] == board[2] and board[2] == board[3]
		check_winner(1, board)
	elsif board[4] == board[5] and board[5] == board[6]
		check_winner(4, board)
	elsif board[7] == board[8] and board[8] == board[9]
		check_winner(7, board)
	elsif board[1] == board[4] and board[4] == board[7]
		check_winner(1, board)
	elsif board[2] == board[5] and board[5] == board[8]
		check_winner(2, board)
	elsif board[3] == board[6] and board[6] == board[9]
		check_winner(3, board)
	elsif board[1] == board[5] and board[5] == board[9]
		check_winner(1, board)
	elsif board[3] == board[5] and board[5] == board[7]
		check_winner(3, board)
	end
end

puts "Welcome to the tic-tac-toe game!"
print_board(instruction)

count = 0
while count<9
	if count%2 == 0 # Player 1
		while true
			print "Player 1\'s turn. Please enter 1~9: "
			fill = gets.chomp
			if input_validation(fill, board)
				board[fill.to_i] = 'O'
				check_result(board)
				break
			else
				next
			end
		end
	else
		while true
			print "Player 2\'s turn. Please enter 1~9: "
			fill = gets.chomp
			if input_validation(fill, board)
				board[fill.to_i] = 'X'
				check_result(board)
				break
			else
				next
			end
		end
	end
	print_board(board)
	count += 1
end
print "It\'s a tie!"