class Board < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  validates :book_title, uniqueness: { case_sensitive: false }
end
