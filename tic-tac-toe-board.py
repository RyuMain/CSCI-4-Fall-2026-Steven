board = [['X', 'O', ' '], [' ', 'X', 'O'], ['X', ' ', ' ']]

for row in board:

    print('-------------')
  

    print('|', end=' ')
    for cell in row:
        print(cell, end=' | ')
    print()

print('-------------')