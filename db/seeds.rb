books =
  case Rails.env
  when "production"
    [
      { title: "Production Book 1", author: "Prod Author 1", price: 10.99, published_date: Date.new(2020, 1, 1) },
      { title: "Production Book 2", author: "Prod Author 2", price: 11.99, published_date: Date.new(2021, 2, 2) },
      { title: "Production Book 3", author: "Prod Author 3", price: 12.99, published_date: Date.new(2022, 3, 3) },
      { title: "Production Book 4", author: "Prod Author 4", price: 13.99, published_date: Date.new(2023, 4, 4) },
      { title: "Production Book 5", author: "Prod Author 5", price: 14.99, published_date: Date.new(2024, 5, 5) }
    ]
  when "test"
    [
      { title: "Test Book 1", author: "Test Author 1", price: 5.99, published_date: Date.new(2020, 1, 1) },
      { title: "Test Book 2", author: "Test Author 2", price: 6.99, published_date: Date.new(2021, 2, 2) },
      { title: "Test Book 3", author: "Test Author 3", price: 7.99, published_date: Date.new(2022, 3, 3) },
      { title: "Test Book 4", author: "Test Author 4", price: 8.99, published_date: Date.new(2023, 4, 4) },
      { title: "Test Book 5", author: "Test Author 5", price: 9.99, published_date: Date.new(2024, 5, 5) }
    ]
  else
    [
      { title: "Development Book 1", author: "Dev Author 1", price: 15.99, published_date: Date.new(2020, 1, 1) },
      { title: "Development Book 2", author: "Dev Author 2", price: 16.99, published_date: Date.new(2021, 2, 2) },
      { title: "Development Book 3", author: "Dev Author 3", price: 17.99, published_date: Date.new(2022, 3, 3) },
      { title: "Development Book 4", author: "Dev Author 4", price: 18.99, published_date: Date.new(2023, 4, 4) },
      { title: "Development Book 5", author: "Dev Author 5", price: 19.99, published_date: Date.new(2024, 5, 5) }
    ]
  end

books.each do |attributes|
  book = Book.find_or_initialize_by(title: attributes[:title])
  book.update!(attributes)
end

puts "Seeded #{books.length} books in the #{Rails.env} environment."
