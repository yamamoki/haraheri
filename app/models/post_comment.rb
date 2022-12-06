class PostComment < ApplicationRecord

  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  belongs_to :user
  belongs_to :list

end
