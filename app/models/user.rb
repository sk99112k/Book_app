class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }

  has_one_attached :profile_image
  
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  #Userがフォローしてる人
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :active_relationships, source: :followed
  #Userをフォローしてる人
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followeds, through: :passive_relationships, source: :follower
  has_many :topics, dependent: :destroy

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpg")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def follow(user)
    active_relationships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end

  def follow?(user)
    followers.include?(user)
  end

end
