class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy
  paginates_per 3

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
