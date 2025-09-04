# Categories
categories = [
  "Fiction", "Historical Fiction", "Science Fiction", "Fantasy", "Mystery & Thriller",
  "Romance", "Horror", "Adventure", "Biography", "Self-Help", "History",
  "Philosophy", "Science", "Religion", "Politics", "Textbooks", "Reference",
  "Children", "Young Adult", "Poetry", "Drama", "Art", "Travel", "Cooking",
  "Health & Fitness", "Business", "Comics"
]

categories.each do |name|
  Category.find_or_create_by!(name: name)
end

# Helper for fetching categories
def find_category(name)
  Category.find_by(name: name)
end

# Books
books = [
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    price: 10.99,
    stock: 5,
    description: "A Jazz Age classic exploring themes of love, wealth, and the American Dream.",
    categories: [ "Fiction", "Historical Fiction" ]
  },
  {
    title: "1984",
    author: "George Orwell",
    price: 8.50,
    stock: 7,
    description: "A dystopian novel depicting a totalitarian regime of surveillance and control.",
    categories: [ "Fiction", "Science Fiction" ]
  },
  {
    title: "Dune",
    author: "Frank Herbert",
    price: 14.50,
    stock: 10,
    description: "A science fiction epic set on the desert planet Arrakis, exploring politics, ecology, and power.",
    categories: [ "Science Fiction", "Adventure" ]
  },
  {
    title: "The Hobbit",
    author: "J.R.R. Tolkien",
    price: 12.00,
    stock: 8,
    description: "A fantasy adventure following Bilbo Baggins as he joins dwarves on a quest to reclaim treasure.",
    categories: [ "Fantasy", "Adventure" ]
  },
  {
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    price: 9.75,
    stock: 6,
    description: "A Pulitzer Prize-winning novel addressing racial injustice and moral growth in the American South.",
    categories: [ "Fiction", "Historical Fiction" ]
  },
  {
    title: "Pride and Prejudice",
    author: "Jane Austen",
    price: 11.25,
    stock: 9,
    description: "A romantic classic exploring love, class, and social expectations in 19th century England.",
    categories: [ "Fiction", "Romance" ]
  },
  {
    title: "The Catcher in the Rye",
    author: "J.D. Salinger",
    price: 10.50,
    stock: 4,
    description: "A coming-of-age novel about teenage rebellion and identity.",
    categories: [ "Fiction", "Young Adult" ]
  },
  {
    title: "The Lord of the Rings",
    author: "J.R.R. Tolkien",
    price: 18.99,
    stock: 12,
    description: "An epic fantasy tale of the battle between good and evil in Middle-earth.",
    categories: [ "Fantasy", "Adventure" ]
  },
  {
    title: "Moby-Dick",
    author: "Herman Melville",
    price: 13.75,
    stock: 3,
    description: "A classic novel of obsession and revenge as Captain Ahab hunts the white whale.",
    categories: [ "Fiction", "Classic" ]
  },
  {
    title: "Harry Potter and the Sorcerer’s Stone",
    author: "J.K. Rowling",
    price: 15.99,
    stock: 15,
    description: "The first book in the beloved fantasy series about the young wizard Harry Potter.",
    categories: [ "Fantasy", "Children" ]
  }
]

books.each do |attrs|
  book = Book.find_or_create_by!(
    title: attrs[:title],
    author: attrs[:author],
    price: attrs[:price],
    stock: attrs[:stock],
    description: attrs[:description]
  )
  book.categories = attrs[:categories].map { |c| find_category(c) }.compact
end
