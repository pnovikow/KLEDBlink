#!/bin/bash

# ASCII-анимация падения мяча
ball_ascii="
  /|
 *  \
    )
   /  "

# Функция отображения ASCII-анимации
function render_animation() {
    # Clear the screen.
    clear

    # Display the ASCII-animation.
    echo $ball_ascii
}

# Функция обновления позиции мяча
function update_ball_position() {
    # Increase the y-coordinate of the ball.
    ball_y=$((ball_y + 1))

    # Check if the ball has reached the bottom of the screen.
    if [[ $ball_y -gt 24 ]]; then
        # The player loses.
        echo "GAME OVER!"
        exit 1
    fi
}

# Основная функция игры
function main() {
    # Инициализация
    ball_y=0

    # Основной цикл игры
    while true; do
        # Обновление позиции мяча
        update_ball_position

        # Отображение ASCII-анимации
        render_animation

        # Пауза
        sleep 0.1
    done
}

# Запуск игры
main
