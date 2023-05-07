class Book < ApplicationRecord

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 2, maximum: 200 }

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
