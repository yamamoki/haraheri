class List < ApplicationRecord
 has_one_attached :image
 has_many :post_comments, dependent: :destroy

 belongs_to :user, optional: true
 belongs_to :genre, optional: true

end
