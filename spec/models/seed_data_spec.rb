require "rails_helper"

RSpec.describe "Seeded test database", type: :model do
  it "contains the five seeded test books" do
    seeded_books = Book.where("title LIKE ?", "Test Book %")

    expect(seeded_books.count).to eq(5)
  end
end
