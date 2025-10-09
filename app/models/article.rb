class Article < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include Visible

  has_many :comments, dependent: :destroy
  paginates_per 3

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
