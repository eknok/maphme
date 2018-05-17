class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  # validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  validate :picture_size

  private

  # アップロードされた画像のサイズをバリデーションする
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
