require "application_system_test_case"

class BooksTest < ApplicationSystemTestCase
  setup do
    @book = books(:one)
  end

  test "visiting the index" do
    visit books_url

    assert_selector "h1", text: "Book Collection"
    assert_text @book.title
    assert_link "Add New Book"
  end

  test "should show book" do
    visit books_url

    click_on "Show", match: :first

    assert_selector "h1", text: "Book Details"
    assert_text @book.title
    assert_link "Back to books"
  end

  test "should create book" do
    visit books_url
    click_on "Add New Book"

    fill_in "Title", with: "Test Book"
    click_on "Create Book"

    assert_text "Book was successfully created"
    assert_text "Test Book"
    assert_current_path books_path
  end

  test "should update book" do
    visit book_url(@book)
    click_on "Edit this book"

    fill_in "Title", with: "Updated Book"
    click_on "Update Book"

    assert_text "Book was successfully updated"
    assert_text "Updated Book"
    assert_current_path books_path
  end

  test "should destroy book" do
    visit books_url
    click_on "Delete", match: :first

    assert_selector "h1", text: "Delete Book"
    assert_text "Are you sure you want to delete"

    click_on "Confirm Delete"

    assert_text "Book was successfully destroyed"
    assert_current_path books_path
  end
end