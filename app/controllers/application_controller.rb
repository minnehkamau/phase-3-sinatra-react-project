class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    books = Book.all
    p books
    books.to_json()
  end

end
