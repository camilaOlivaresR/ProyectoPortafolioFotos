class User < ApplicationRecord
  enum :role, [:normal_user, :author, :admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= normal_user
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  
  

  validates :name, presence: true
end
