puts "🌱 Seeding spices..."

#creating books
b1 = Book.create(
  image_url: "https://rb.gy/ciclzd",
  title: "Shoe Dog",
  author: "Phil Knight",
  genre: "Business"
)

b2 = Book.create(
  image_url: "https://rb.gy/zbbz1d",
  title: "The Power of Now",
  author: "Ekhart Tolle",
  genre: "Self-help" 
)

b3 = Book.create(
  image_url: "https://rb.gy/m5cl8j",
  title: "Think and Grow Rich",
  author: "Napoleon Hill",
  genre: "Business"
)

b4 = Book.create(
  image_url: "https://rb.gy/f9ahxa",
  title: "Normal People",
  author: "Sally Rooney",
  genre: "Fiction"
)

#creating Users
u1 = User.create(
  name: "John Doe",
  username: "John",
  email: "john@example.com",
  password: "password"
)

u2 = User.create(
  name: "George Hill",
  username: "George",
  email: "george@example.com",
  password: "pass123"
)

#Creating reviews
r1 = Review.create(
  comment: "A great read that explains the rollercoaster faced by the man behind Nike shoe company",
  rating: "5",
  user_id: u1.id,
  book_id: b1.id
)

r2 = Review.create(
  comment: "Definitely a book that I would read over and over again",
  rating: "4",
  user_id: u2.id,
  book_id: b1.id
)

r3 = Review.create(
  comment: "The book started well but it got more and more repetitive",
  rating: "2",
  user_id: u1.id,
  book_id: b4.id
)

r4 = Review.create(
  comment: "Great read that illustrates how we need to have a burning desire in order to reach our goals",
  rating: "4",
  user_id: u2.id,
  book_id: b3.id
)

puts "✅ Done seeding!"
