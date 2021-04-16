class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, length: { 
    maximum: 50,
    minimum: 2,
    message: " must be between 2 to 50 characters."
  }, on: :update, on: :create
end
