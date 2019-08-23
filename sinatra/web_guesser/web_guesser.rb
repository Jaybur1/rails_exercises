require 'sinatra'
require 'sinatra/reloader'


set :generate_rand_num , Proc.new {rand(1..100)}
set :new_game, Proc.new {SECRET_NUM = settings.generate_rand_num}
SECRET_NUM = settings.generate_rand_num

def background(guess)
  return "white" if guess == 0
  
  if guess == SECRET_NUM
    return 'green'
  elsif guess.between?((SECRET_NUM - 5),SECRET_NUM) || guess.between?(SECRET_NUM,(SECRET_NUM + 5))
    return 'lightred'
  elsif guess < (SECRET_NUM - 5) || guess > (SECRET_NUM + 5)
    return 'red'
  
  end
end

def check_guess(guess)
  return "Give me a number" if guess == 0

  return "NOPE, TO HIGH" if guess > SECRET_NUM
  return "NOPE, TO LOW" if guess < SECRET_NUM
  return "YES!!! THAT'S IS CORRECT" if guess == SECRET_NUM
  
end
 
get '/' do 
  user_guess = params["guess"].to_i
  
  output = check_guess(user_guess)
  erb :index, locals: {
    secret_num: SECRET_NUM,
    output: output,
    background: background(user_guess.to_i),
  
  }
  #throw params.inspect
end