class List < ApplicationRecord
 has_one_attached :image
 has_many :post_comments, dependent: :destroy
 has_many :favorites, dependent: :destroy

 has_many :post_tags, dependent: :destroy
 has_many :tags, through: :post_tags, dependent: :destroy

 belongs_to :user, optional: true
 belongs_to :genre, optional: true

 enum draft: { release: 0, draft: 1 }

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
