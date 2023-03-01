class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  
  
  get "/" do
    { message: "Getting started with my project" }.to_json
  end
  #GETTING ALL BOOKS

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

  #adding a new book
  post "/books" do
    book = Book.create(
      image_url: params[:image_url],
      author: params[:author],
      title: params[:title],
      genre: params[:genre]
    )
    book.to_json()
  end

  #Patching a book
  patch "/books/:id" do
    book = Book.find_by(id: params[:id])

    book.update(
      image_url: params[:image_url],
      author: params[:author],
      title: params[:title],
      genre: params[:genre]
    )
    book.to_json()
  end
  #Deleting single book
  delete "/books/:id" do
    book = Book.find_by(id: params[:id])
    book.destroy
    book.to_json()
    

  end

end
