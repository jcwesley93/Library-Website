class Book < ApplicationRecord
    validates :title, uniqueness: [scope: :authors, message: "author already exists"]
    has_many :book_authors
    has_many :authors, through: :book_authors
end
