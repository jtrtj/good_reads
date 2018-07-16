require 'rails_helper'

describe 'visitor' do
  context 'visiting books index' do
    it 'will see a list of all books and their titles will be links to show pages' do
      bk_1 = Book.create(title: 'sdfg')
      bk_2 = Book.create(title: 'hgfd')

      visit books_path

      expect(page).to have_content(bk_1.title)
      expect(page).to have_content(bk_2.title)

      click_on "#{bk_1.title}"

      expect(current_path).to eq(book_path(bk_1))
    end
  end

  context 'visiting book show page' do
    it 'will see the book title and a list of reviews for the book' do
      user = User.create(name: 'joe')
      bk_1 = Book.create(title: 'sdfg')
      review = user.reviews.create(book_id: bk_1.id, body: 'great book', rating: 5)

      visit book_path(bk_1)

      expect(page).to have_content(bk_1.title)
      expect(page).to have_content("User: #{review.user.name}")
      expect(page).to have_content("Review: #{review.body}")
      expect(page).to have_content("Rating: #{review.rating}")
    end

    it 'will see the average rating for that book' do
      user = User.create(name: 'joe')
      bk_1 = Book.create(title: 'sdfg')
      review = user.reviews.create(book_id: bk_1.id, body: 'great book', rating: 5)
      review = user.reviews.create(book_id: bk_1.id, body: 'great book', rating: 3)

      visit book_path(bk_1)

      expect(page).to have_content("Average Rating: 4")
    end
  end
end

=begin
As a Visitor,
When I visit a book show page,
I see a heading that includes the highest rating for that book.

(e.g "Highest Rating: 4").
=end