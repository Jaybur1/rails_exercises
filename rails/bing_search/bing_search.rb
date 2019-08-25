require 'rest-client'


class Bing_search
  attr_accessor :query, :result

  URL = 'https://www.bing.com/search' #set the search url

  def initialize(query)
    @query = query 
  end

  def replace_spaces #modify the string so it will be query like
    @query.gsub!(/\s/, '+');
  end

  def begin_search # call the rest-client get method for the url + the modified query parameter
    replace_spaces
    @result = RestClient.get URL, {params: {q: @query}}
  end

  def display_result # print the results
    p @result.code
    p @result.cookies
    p @result.headers
    p @result.body
  end
 #print the results individualy
  def display_code 
    p @result.code     
  end 

  def display_cookies
    p @result.cookies    
  end

  def display_headers
    p @result.headers  
  end

  def display_body
    p @result.body  
  end
end


puts "What we are looking for today?"

query = gets.chomp

bing_search = Bing_search.new(query)
bing_search.begin_search
bing_search.display_result