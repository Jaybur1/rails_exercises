class ApplicationController < ActionController::Base
  protect_from_forgery with: :exeption 

  def hello 
    render html: "hello world!"
  end
end
