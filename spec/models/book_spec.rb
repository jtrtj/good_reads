require 'rails_helper'

describe Book do
  context 'instance methods' do
    it '#avg_rating' do
      user = User.create(name: 'joe')
      bk_1 = Book.create(title: 'sdfg')
      review_1 = user.reviews.create(book_id: bk_1.id, body: 'great book', rating: 4)
      review_2 = user.reviews.create(book_id: bk_1.id, body: 'great book', rating: 2)

      expect(bk_1.avg_rating).to eq(3)
    end

    it '#highest_rating' do
      user = User.create(name: 'joe')
      bk_1 = Book.create(title: 'sdfg')
      review_1 = user.reviews.create(book_id: bk_1.id, body: 'great book', rating: 4)
      review_2 = user.reviews.create(book_id: bk_1.id, body: 'great book', rating: 2)

      expect(bk_1.highest_rating).to eq(4)
    end
  end
end