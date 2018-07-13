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
end

=begin
As a Visitor,
When I visit a book index page,
I see all book titles in the database,
And each book title is a link to that book's show page.
=end