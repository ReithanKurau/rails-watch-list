class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_one_attached :photo

  validates :name, presence: true, uniqueness: { case_sensitive: false, message: 'please try again' }
end
