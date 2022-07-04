class PostComment < ApplicationRecord

  belongs_to :end_user
  belongs_to :post_sushi

  validates :comment, presence: true
end
