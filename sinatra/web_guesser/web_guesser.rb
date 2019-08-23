require 'sinatra'
require 'sinatra/reloader'


set :generate_rand_num , Proc.new {rand(1..100)}
SECRET_NUM = settings.generate_rand_num


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
    output: output
  }
  #throw params.inspect
end