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
      review_1 = user.reviews.create(book_id: bk_1.id, body: 'great book', rating: 5)
      review_2 = user.reviews.create(book_id: bk_1.id, body: 'great book', rating: 3)

      visit book_path(bk_1)

      expect(page).to have_content("Average Rating: 4")
    end

    it 'will see the highest rating for that book and corresponding review' do
      user = User.create!(name: 'joe')
      bk_1 = Book.create!(title: 'sdfg')
      review_1 = user.reviews.create!(book_id: bk_1.id, body: 'great book', rating: 5)
      review_2 = user.reviews.create!(book_id: bk_1.id, body: 'great book', rating: 3)

      visit book_path(bk_1)
      within "#high" do
        expect(page).to have_content("Review: #{review_1.body}")
        expect(page).to have_content("User: #{review_1.user.name}")
        expect(page).to have_content("Highest Rating: 5")
      end
    end
  end
end

=begin
As a Visitor,
When I visit a book show page,
under the heading for highest rating,
I see the review text, and the name of the reviewer
that submitted that review.

(it's okay if the review is also listed again on the page later with all other reviews)
=end