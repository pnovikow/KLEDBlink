#!/bin/bash

# Объявляем переменные
board=
player=x

# Функция вывода игрового поля
function print_board() {
  echo "    1 2 3"
  echo "  -----------"
  for i in {1..3}; do
    echo " $i |"
    for j in {1..3}; do
      echo -n " ${board[$i,$j]} |"
    done
    echo
  done
}

# Функция проверки победы
function check_win() {
  for i in {1..3}; do
    if [[ ${board[$i,1]} == ${board[$i,2]} && ${board[$i,2]} == ${board[$i,3]} ]]; then
      return 1
    elif [[ ${board[1,$i]} == ${board[2,$i]} && ${board[2,$i]} == ${board[3,$i]} ]]; then
      return 1
    elif [[ ${board[1,1]} == ${board[2,2]} && ${board[2,2]} == ${board[3,3]} ]]; then
      return 1
    elif [[ ${board[3,1]} == ${board[2,2]} && ${board[2,2]} == ${board[1,3]} ]]; then
      return 1
    fi
  done
  return 0
}

# Функция хода игрока
function player_turn() {
  echo "Ход игрока $player:"
  read pos
  pos=$((pos - 1))
  if [[ $pos < 1 || $pos > 9 ]]; then
    echo "Неверный ввод."
    return
  fi
  if [[ ${board[$pos/3,$pos%3]} != "" ]]; then
    echo "Ячейка уже занята."
    return
  fi
  board[$pos/3,$pos%3]=$player
}

# Основная функция игры
function main() {
  # Инициализация игрового поля
  for i in {1..3}; do
    for j in {1..3}; do
      board[$i,$j]=""
    done
  done

  # Основной цикл игры
  while true; do
    # Печать игрового поля
    print_board

    # Ход игрока
    player_turn

    # Проверка победы
    if check_win; then
      echo "Победил игрок $player!"
      break
    fi

    # Смена игрока
    if [[ $player == x ]]; then
      player=o
    else
      player=x
    fi
  done
}

# Запуск игры
main
