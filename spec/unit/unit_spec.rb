require "rails_helper"

RSpec.describe Book, type: :model do
  it "is valid with a title" do
    book = Book.new(title: "Harry Potter")
    expect(book).to be_valid
  end

  it "is not valid without a title" do
    book = Book.new(title: nil)
    expect(book).not_to be_valid
  end

  it "accepts an author" do
    book = Book.new(title: "Harry Potter", author: "J. K. Rowling")
    expect(book.author).to eq("J. K. Rowling")
  end

  it "accepts a price" do
    book = Book.new(title: "Harry Potter", price: 19.99)
    expect(book.price).to eq(19.99)
  end

  it "accepts a published date" do
    date = Date.new(1997, 6, 26)
    book = Book.new(title: "Harry Potter", published_date: date)
    expect(book.published_date).to eq(date)
  end
end
