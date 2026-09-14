require "rails_helper"

RSpec.describe "user_books/index", type: :view do
  let(:user) { User.create!(username: "Test User") }
  let(:book) { Book.create!(title: "Test Book") }

  before(:each) do
    assign(:user_books, [
      UserBook.create!(
        user: user,
        book: book
      ),
      UserBook.create!(
        user: user,
        book: book
      )
    ])
  end

  it "renders a list of user_books" do
    render

    assert_select "div>p", text: /Test User/, count: 2
    assert_select "div>p", text: /Test Book/, count: 2
  end
end
