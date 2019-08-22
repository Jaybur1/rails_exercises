require 'sinatra'
require 'sinatra/reloader'


def generate_rand_num(max_num)
  rand(max_num + 1)
end


secret_num = generate_rand_num(101)

get '/' do 
  "The secret number is #{secret_num}"  
end