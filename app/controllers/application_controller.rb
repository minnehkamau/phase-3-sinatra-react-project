class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  #getting all books
  get "/" do
    { message: "Getting started with my project" }.to_json
  end

  get "/books" do
    books = Book.all
    p books
    books.to_json()
  end

  #geting a single book
  get "/books/:id" do
    book = Book.find_by(id: params[:id])
    book.to_json()
  end

end
