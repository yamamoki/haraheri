class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :list, optional: true

  validates :comment, presence: true

end
