class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :dogs
  has_many :reviews, inverse_of: :user


  mount_uploader :photo, PhotoUploader

  # validates :first_name, presence: true
  # validates :last_name, presence: true
end
