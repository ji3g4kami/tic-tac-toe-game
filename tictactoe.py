#! /usr/bin/env python3

board = ['', '', '', '', '', '', '', '', '', '']

def print_board():
	print(board[1].center(3) + '|' + board[2].center(3) + '|' + board[3].center(3))
	print('-'*11)
	print(board[4].center(3) + '|' + board[5].center(3) + '|' + board[6].center(3))
	print('-'*11)
	print(board[7].center(3) + '|' + board[8].center(3) + '|' + board[9].center(3))


# Input Validation
def input_validation(fill):
	if fill.isdecimal():
		if int(fill) <=9 and int(fill) >= 1: 
			if board[int(fill)] == '':
				return True
			else:
				print('This place is not empty. Please enter an empty space:')	
		else:
			print('Out of range. Please enter 1~8: ')
	else:
		print('Invalid input. Please enter an empty space:')
		return False

# TODO: Check who wins the game
def check_winner(n):
	if board[n] == 'O':
		print_board()
		print('Player 1 wins the game!')
		exit()
	elif board[n] == 'X':
		print_board()
		print('Player 2 wins the game!')
		exit()

def check_result():
	if board[1] == board[2] and board[2] == board[3]:
		check_winner(1)
	elif board[4] == board[5] and board[5] == board[6]:
		check_winner(4)
	elif board[7] == board[8] and board[8] == board[9]:
		check_winner(7)
	elif board[1] == board[4] and board[4] == board[7]:
		check_winner(1)
	elif board[2] == board[5] and board[5] == board[8]:
		check_winner(2)
	elif board[3] == board[6] and board[6] == board[9]:
		check_winner(3)
	elif board[1] == board[5] and board[5] == board[9]:
		check_winner(1)
	elif board[3] == board[5] and board[5] == board[7]:
		check_winner(3)


# MAIN : 2 players take turn to fill in O or X
print(' 1 | 2 | 3 ')
print('-'*11)
print(' 4 | 5 | 6 ')
print('-'*11)
print(' 7 | 8 | 9 ')

count = 0
while count<9:
	if count%2 == 0: # Player 1
		while True:
			fill = input('Player 1\'s turn. Please enter 0~8: ')
			if input_validation(fill):
				board[int(fill)] = 'O'
				check_result()
				break
			else:
				continue

	else: # Player 2
		while True:
			fill = input('Player 2\'s turn. Please enter 0~8: ')
			if input_validation(fill):
				board[int(fill)] = 'X'
				check_result()
				break
			else:
				continue
	
	print_board()
	count += 1

print('It\'s a tie!')	
