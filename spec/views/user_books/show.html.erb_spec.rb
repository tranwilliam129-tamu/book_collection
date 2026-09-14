require "rails_helper"

RSpec.describe "user_books/show", type: :view do
  let(:user) { User.create!(username: "Test User") }
  let(:book) { Book.create!(title: "Test Book") }

  before(:each) do
    assign(:user_book, UserBook.create!(
      user: user,
      book: book
    ))
  end

  it "renders the username and book title" do
    render

    expect(rendered).to match(/Test User/)
    expect(rendered).to match(/Test Book/)
  end
end
