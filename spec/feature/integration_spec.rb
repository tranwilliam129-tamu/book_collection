require "rails_helper"

RSpec.describe "Creating a book", type: :feature do
  scenario "creates a book with a valid title" do
    visit new_book_path

    fill_in "book[title]", with: "Harry Potter"
    click_on "Create Book"

    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("Harry Potter")
  end

  scenario "does not create a book with a blank title" do
    visit new_book_path

    fill_in "book[title]", with: ""
    click_on "Create Book"

    expect(page).to have_content("Title can't be blank")
  end

  scenario "creates a book with an author" do
    visit new_book_path

    fill_in "book[title]", with: "Harry Potter"
    fill_in "book[author]", with: "J. K. Rowling"
    click_on "Create Book"

    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("J. K. Rowling")
  end

  scenario "creates a book with a price" do
    visit new_book_path

    fill_in "book[title]", with: "Harry Potter"
    fill_in "book[price]", with: "19.99"
    click_on "Create Book"

    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("19.99")
  end

  scenario "creates a book with a published date" do
    visit new_book_path

    fill_in "book[title]", with: "Harry Potter"

    select "1997", from: "book[published_date(1i)]"
    select "June", from: "book[published_date(2i)]"
    select "26", from: "book[published_date(3i)]"

    click_on "Create Book"

    expect(page).to have_content("Book was successfully created.")
    expect(page).to have_content("1997")
  end
end
