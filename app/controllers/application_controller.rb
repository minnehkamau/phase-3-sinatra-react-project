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
  #USERS
  ## getting all users
  get "/users" do
    users = User.all
    users.to_json
  end
  ##getting a single user

  get "/users/:id" do
    user = User.find_by(id: params[:id])
    user.to_json
  end

  ## posting a user

  post '/users' do
    user = User.find_by(email: params[:myemail])
    if user.present?
      message = { error: "Email exists already!" }
    elsif params[:myusername].present? && params[:myemail].present? && params[:myname].present?
      user = User.new(username: params[:myusername], email: params[:myemail], name: params[:myname])
      if user.save
        message = { success: "User has been created successfully!" }
      else
        message = { error: "Error occured when saving user!" }
      end
    else
      message = { error: "Fill all fields should be filled!" }
    end
    message.to_json
  end

  ## Deleting User
  delete "/users/:id" do
    count_users = User.where(id: params[:id]).count() #Integer 2,3,4,5
    if count_users>0
        user = User.find(params[:id])
        user.destroy
        message = {:succcess => "User has been deleted successfully!!"}
        message.to_json

    else
        message = {:error => "User entered does not exist!"}
        message.to_json
    end


end

##REVIEWS
#getting all reviews
  # get "/reviews" do
  #   reviews = Review.all
  #   reviews.to_json(include: { reviews: { include: :user }})
  # end
  get "/reviews" do
    reviews = Review.all.includes(:book, :user)
    reviews.to_json(include: [:book, :user])
  end

  # getting single review

  get "/reviews/:id" do
    review = Review.find_by(id: params[:id])
    review.to_json

  end


  #add a review
  post "/reviews" do
    review = Review.create(
      comment: params[:comment],
      rating: params[:rating],
      user_id: params[:user_id],
      book_id: params[:book_id]
    )
    review.to_json()
  end
  
  
  
  #UPDATING REVIEW

  patch "/reviews/:id" do
    @review = Review.find_by(id: params[:id])
    
    if @review.update(review_params)
      status 200
      json @review
    else
      status 422
      json @review.errors
    end
  end
  
  def review_params
    {
      comment: params[:comment],
      rating: params[:rating],
      user_id: params[:user_id],
      book_id: params[:book_id]
    }
  end
  ## delete a review
  delete "/reviews/:id" do
    @review = Review.find_by(id: params[:id])
  
    if @review
      @review.destroy
      status 204
    else
      status 404
      json error: "Review not found"
    end
  end
  
  
end




