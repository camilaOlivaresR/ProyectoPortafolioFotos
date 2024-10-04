class Image < ApplicationRecord
  belongs_to :Imageable, polymorphic: true
  has_one_attached :file, dependent: :destroy

  validates :file, presence: true
end
