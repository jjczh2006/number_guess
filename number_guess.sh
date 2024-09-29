#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"
#Your script should randomly generate a number between 1 and 1000 that users have to guess
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
#TRUNCATE_RESULT=$($PSQL "truncate guess")
#echo $SECRET_NUMBER
#When you run your script, you should prompt the user for a username with Enter your username:, and take a username as input. Your database should allow usernames that are 22 characters
echo "Enter your username:"
read USER_NAME

#If that username has been used before, it should print Welcome back, <username>! You have played <games_played> games, and your best game took <best_game> guesses.
#, with <username> being a users name from the database, <games_played> being the total number of games that user has played, and <best_game> being the fewest number of guesses it took that user to win the game
USERNAME_RESULT=$($PSQL "select user_name FROM guess WHERE user_name='$USER_NAME'")

#If the username has not been used before, you should print Welcome, <username>! It looks like this is your first time here.
if [[ -z $USERNAME_RESULT ]]
then
  INSERT_USERNAME_RESULT=$($PSQL "insert into guess (user_name, num_games, best_games) values ('$USER_NAME', 1, null)")
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
else
  #echo "old gamer"
  NUM_GAMES=$($PSQL "select num_games FROM guess WHERE user_name='$USER_NAME'")
  BEST_GAMES=$($PSQL "select best_games FROM guess WHERE user_name='$USER_NAME'")
  echo "Welcome back, $USER_NAME! You have played $NUM_GAMES games, and your best game took $BEST_GAMES guesses."
fi

#The next line printed should be Guess the secret number between 1 and 1000: and input from the user should be read
echo "Guess the secret number between 1 and 1000:"
read USER_GUESS
GUESS_COUNT=1

until [[ $USER_GUESS == $SECRET_NUMBER ]]
do
  if [[ $USER_GUESS =~ ^[0-9]+$ ]]
  then
    if (( $USER_GUESS < $SECRET_NUMBER ))
    then
      echo "It's lower than that, guess again:"
    else
      echo "It's higher than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
  fi
  read USER_GUESS
  ((GUESS_COUNT++))
done

#Until they guess the secret number, it should print It's lower than that, guess again: if the previous input was higher than the secret number, and It's higher than that, guess again: if the previous input was lower than the secret number. Asking for input each time until they input the secret number.

#If anything other than an integer is input as a guess, it should print That is not an integer, guess again:

#When the secret number is guessed, your script should print You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job! and finish running
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"

NUM_GAMES=$NUM_GAMES+1
if [[ -z $BEST_GAMES ]]
then
  UPDATE_USER_RESULT=$($PSQL "update guess set num_games=$NUM_GAMES, best_games=$GUESS_COUNT where user_name='$USER_NAME'")
else
  if (( $GUESS_COUNT < $BEST_GAMES ))
  then
    UPDATE_USER_RESULT=$($PSQL "update guess set num_games=$NUM_GAMES, best_games=$GUESS_COUNT where user_name='$USER_NAME'")
  else
    UPDATE_USER_RESULT=$($PSQL "update guess set num_games=$NUM_GAMES where user_name='$USER_NAME'")
  fi
fi