class Genre < ApplicationRecord

  has_many :lists, dependent: :destroy

end
