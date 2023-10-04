#!/bin/bash

# Объявляем переменные
word="apple"
guesses=""
wrong_guesses=0

# Функция вывода подсказок
function print_hints() {
  for i in {0..$wrong_guesses}; do
    echo -n " "
  done
  for i in {0..${#word}-1}; do
    if [[ ${guesses[$i]} == "" ]]; then
      echo -n "_"
    else
      echo -n "${word[$i]}"
    fi
  done
}

# Функция проверки победы
function check_win() {
  for i in {0..${#word}-1}; do
    if [[ ${guesses[$i]} == "" ]]; then
      return 0
    fi
  done
  return 1
}

# Функция хода игрока
function player_turn() {
  echo "Введите букву:"
  read letter
  if [[ ${word} == *${letter}* ]]; then
    for i in {0..${#word}-1}; do
      if [[ ${word[$i]} == ${letter} ]]; then
        guesses[$i]=${letter}
      fi
    done
  else
    wrong_guesses=$((wrong_guesses + 1))
  fi
}

# Основная функция игры
function main() {
  # Печать подсказок
  print_hints

  # Ход игрока
  player_turn

  # Проверка победы
  if check_win; then
    echo "Поздравляем! Вы выиграли!"
    return
  fi

  # Проверка проигрыша
  if [[ $wrong_guesses == 6 ]]; then
    echo "Вы проиграли! Правильным словом было \"$word\"."
    return
  fi

  # Повтор игры
  main
}

# Запуск игры
main
