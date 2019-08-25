require 'sinatra'
require 'sinatra/reloader' 

@@secret_num = rand(1..100)
@@fails = 5


def background(guess)
  return "white" if guess == 0
  
  if guess == @@secret_num
    return 'green'
  elsif guess.between?((@@secret_num - 5),@@secret_num) || guess.between?(@@secret_num,(@@secret_num + 5))
    return 'lightred'
  elsif guess < (@@secret_num - 5) || guess > (@@secret_num + 5)
    return 'red'
  
  end
end

def check_guess(guess)
  return "Give me a number" if guess == 0

  return "NOPE, TO HIGH" if guess > @@secret_num
  return "NOPE, TO LOW" if guess < @@secret_num
  return "YES!!! THAT'S IS CORRECT" if guess == @@secret_num
  
end

def reset_game
  @@fails = 6
  @@secret_num = rand(1..100)
  user_guess = 0
end

def check_game(guess,output)
  if guess == @@secret_num
    output == 'THAT IS CORRECT, LETS TRY NEW ONE'
    reset_game
  elsif @@fails == 0
    output == 'NO MORE TRIES LEFT, LETS TRY NEW ONE'
    reset_game
  end
end
 
get '/' do 
  user_guess = params["guess"].to_i
  @@fails -= 1
  output = check_guess(user_guess)
  check_game(user_guess,output)
  
  erb :index, locals: {
    secret_num: @@secret_num,
    output: output,
    background: background(user_guess),
    tries: @@fails
   }
  #throw params.inspect
end