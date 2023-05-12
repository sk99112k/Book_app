class Topic < ApplicationRecord

  belongs_to :user

  mount_uploader :image, ImageUploader
  has_one_attached :topic_image

  def get_topic_image(width, height)
    unless topic_image.attached?
      file_path = Rails.root.join("app/assets/images/no_image_pictuer.jpg")
      profile_image.attach(io: File.open(file_path), filename: "default-image.jpg", content_type: "image/jpeg")
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
