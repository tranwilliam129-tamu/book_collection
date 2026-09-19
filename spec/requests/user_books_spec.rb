require 'rails_helper'

RSpec.describe "/user_books", type: :request do
  let!(:admin) do
    Admin.create!(
      email: "request-admin@example.com",
      uid: "request-admin",
      full_name: "Request Admin"
    )
  end

  before do
    sign_in admin
  end

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      UserBook.create! valid_attributes
      get user_books_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user_book = UserBook.create! valid_attributes
      get user_book_url(user_book)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_book_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      user_book = UserBook.create! valid_attributes
      get edit_user_book_url(user_book)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new UserBook" do
        expect {
          post user_books_url, params: { user_book: valid_attributes }
        }.to change(UserBook, :count).by(1)
      end

      it "redirects to the created user_book" do
        post user_books_url, params: { user_book: valid_attributes }
        expect(response).to redirect_to(user_book_url(UserBook.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new UserBook" do
        expect {
          post user_books_url, params: { user_book: invalid_attributes }
        }.to change(UserBook, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post user_books_url, params: { user_book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested user_book" do
        user_book = UserBook.create! valid_attributes
        patch user_book_url(user_book), params: { user_book: new_attributes }
        user_book.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the user_book" do
        user_book = UserBook.create! valid_attributes
        patch user_book_url(user_book), params: { user_book: new_attributes }
        user_book.reload
        expect(response).to redirect_to(user_book_url(user_book))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        user_book = UserBook.create! valid_attributes
        patch user_book_url(user_book), params: { user_book: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_content)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user_book" do
      user_book = UserBook.create! valid_attributes
      expect {
        delete user_book_url(user_book)
      }.to change(UserBook, :count).by(-1)
    end

    it "redirects to the user_books list" do
      user_book = UserBook.create! valid_attributes
      delete user_book_url(user_book)
      expect(response).to redirect_to(user_books_url)
    end
  end
end
