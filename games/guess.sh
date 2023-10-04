#!/bin/bash

# Генерируем случайное число
secret_number=$((RANDOM % 100 + 1))

# Запускаем цикл игры
while true; do
  # Просим пользователя ввести число
  echo "Угадай число от 1 до 100:"
  read guess

  # Проверяем, угадал ли пользователь
  if [[ $guess -eq $secret_number ]]; then
    echo "Поздравляю! Ты угадал!"
    break
  else
    if [[ $guess -lt $secret_number ]]; then
      echo "Твое число слишком маленькое."
    else
      echo "Твое число слишком большое."
    fi
  fi
done
