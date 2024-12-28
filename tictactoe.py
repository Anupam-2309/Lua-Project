import tkinter as tk
from tkinter import messagebox

class BigTicTacToe:
    def __init__(self, root):
        self.root = root
        self.root.title("Big Tic-Tac-Toe")

        # Initialize game variables
        self.current_player = 'X'
        self.big_board = [None] * 9  # Keeps track of the 9 small boards
        self.small_boards = [[None] * 9 for _ in range(9)]  # 9 small 3x3 boards
        self.active_small_board = None  # Current small board to play in

        # Create the GUI layout
        self.buttons = []
        self.create_game_board()

        # Game status label
        self.status_label = tk.Label(self.root, text="Player X's Turn", font=('Arial', 14))
        self.status_label.grid(row=0, column=0, columnspan=3)

        # Reset button
        self.reset_button = tk.Button(self.root, text="Reset Game", command=self.reset_game, font=('Arial', 12))
        self.reset_button.grid(row=10, column=0, columnspan=3)

    def create_game_board(self):
        """Create the 3x3 grid of small boards."""
        for i in range(9):
            small_board_frame = tk.Frame(self.root)
            small_board_frame.grid(row=i//3 + 1, column=i%3, padx=5, pady=5)
            small_board_buttons = []

            for j in range(9):
                button = tk.Button(small_board_frame, text='', width=5, height=2, font=('Arial', 20),
                                   command=lambda i=i, j=j: self.handle_cell_click(i, j))
                button.grid(row=j//3, column=j%3)
                small_board_buttons.append(button)

            self.buttons.append(small_board_buttons)

    def handle_cell_click(self, small_board_index, cell_index):
        """Handle a click on a specific cell."""
        # Check if the move is valid
        if self.small_boards[small_board_index][cell_index] is not None:
            return
        
        if self.active_small_board is not None and self.active_small_board != small_board_index and self.big_board[self.active_small_board] is None:
            self.status_label.config(text=f"Player {self.current_player}: Play in board {self.active_small_board + 1}")
            return

        # Mark the cell with the current player's symbol
        self.small_boards[small_board_index][cell_index] = self.current_player
        self.buttons[small_board_index][cell_index].config(text=self.current_player)

        # Check if this small board has been won
        if self.check_winner(self.small_boards[small_board_index]):
            self.big_board[small_board_index] = self.current_player
            self.update_big_board(small_board_index)

        # Check if the big board has been won
        if self.check_winner(self.big_board):
            messagebox.showinfo("Game Over", f"Player {self.current_player} wins the game!")
            self.disable_all_buttons()
            return

        # Switch player
        self.current_player = 'O' if self.current_player == 'X' else 'X'

        # Update active small board (based on the last move)
        if self.big_board[cell_index] is None:
            self.active_small_board = cell_index
            self.status_label.config(text=f"Player {self.current_player}: Play in board {cell_index + 1}")
        else:
            self.active_small_board = None
            self.status_label.config(text=f"Player {self.current_player}: Free choice of board")

    def check_winner(self, board):
        """Check if a player has won on the board (either small or big)."""
        win_combinations = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],  # Rows
            [0, 3, 6], [1, 4, 7], [2, 5, 8],  # Columns
            [0, 4, 8], [2, 4, 6]              # Diagonals
        ]
        for combo in win_combinations:
            if board[combo[0]] == board[combo[1]] == board[combo[2]] != None:
                return True
        return False

    def update_big_board(self, small_board_index):
        """Update the big board with the winner of the small board."""
        small_board_frame = self.buttons[small_board_index][0].master
        winner = self.big_board[small_board_index]
        for button in small_board_frame.winfo_children():
            button.config(state=tk.DISABLED)

    def disable_all_buttons(self):
        """Disable all buttons after the game ends."""
        for small_board in self.buttons:
            for button in small_board:
                button.config(state=tk.DISABLED)

    def reset_game(self):
        """Reset the game to its initial state."""
        self.current_player = 'X'
        self.big_board = [None] * 9
        self.small_boards = [[None] * 9 for _ in range(9)]
        self.active_small_board = None
        self.status_label.config(text="Player X's Turn")

        for small_board in self.buttons:
            for button in small_board:
                button.config(text='', state=tk.NORMAL)
                
# Create the main window
root = tk.Tk()
game = BigTicTacToe(root)

# Run the application
root.mainloop()
