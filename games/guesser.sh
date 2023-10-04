#!/bin/bash

# Display the game's instructions.
function show_instructions() {
    echo "Welcome to the mini console game!"
    echo "To play, simply enter a number between 1 and 10."
    echo "If you guess the correct number, you win!"
    echo "If you guess incorrectly, you lose!"
}

# Start the game loop.
function game_loop() {
    # Generate a random number between 1 and 10.
    secret_number=$((RANDOM % 10 + 1))

    # Ask the player to guess a number.
    echo "Enter a number between 1 and 10: "
    read player_guess

    # Check if the player guessed correctly.
    if [[ $player_guess -eq $secret_number ]]; then
        echo "Congratulations! You guessed correctly!"
        exit 0
    else
        echo "Sorry, you guessed incorrectly."
        echo "The correct number was $secret_number."
        exit 1
    fi
}

# Handle player input.
function handle_input() {
    # Read the player's input.
    read player_input

    # Check if the player wants to quit the game.
    if [[ $player_input -eq "q" ]]; then
        exit 0
    fi

    # Validate the player's input.
    if [[ $player_input -lt 1 || $player_input -gt 10 ]]; then
        echo "Invalid input. Please enter a number between 1 and 10."
        handle_input
    fi

    # Start the game loop.
    game_loop
}

# Render the game's graphics.
function render_graphics() {
    # Clear the screen.
    clear

    # Display the game's title.
    echo "Mini Console Game"

    # Display the player's guess.
    echo "Your guess: $player_guess"

    # Display the game's instructions.
    show_instructions
}

# Check if the player has won or lost.
function check_win_lose() {
    # Check if the player guessed correctly.
    if [[ $player_guess -eq $secret_number ]]; then
        echo "Congratulations! You guessed correctly!"
        exit 0
    else
        echo "Sorry, you guessed incorrectly."
        echo "The correct number was $secret_number."
        exit 1
    fi
}

# End the game.
function end_game() {
    # Exit the script.
    exit 0
}

# Start the game.
render_graphics
handle_input
