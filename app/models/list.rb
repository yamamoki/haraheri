class List < ApplicationRecord

 has_many :post_comments, dependent: :destroy
 
 belongs_to :user
 belongs_to :genre
  
end
