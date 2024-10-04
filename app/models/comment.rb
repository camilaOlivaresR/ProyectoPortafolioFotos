class Comment < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :picture, dependent: :destroy

  validates :content, presence: true
end
