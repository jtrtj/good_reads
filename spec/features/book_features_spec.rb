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
      review = user.reviews.create(book_id: bk_1.id, body: 'great book' )

      visit book_path(bk_1)

      expect(page).to have_content(bk_1.title)
      expect(page).to have_content(review.user.id)
      expect(page).to have_content(review.body)
    end
  end
end

=begin
As a Visitor,
When I visit a book show page,
I see the book title and a list of reviews for that book.
The review shown should include the text of the review, and user who wrote the review.
=end