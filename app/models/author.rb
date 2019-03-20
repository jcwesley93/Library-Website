class Author < ApplicationRecord
    validates :name, presence: true
    validates :birth_year, numericality: {less_than_or_equal_to: Time.now.year, greater_than: 0}

    has_many :book_authors
    has_many :books, through: :book_authors
end
