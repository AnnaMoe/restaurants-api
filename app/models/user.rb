class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # every time a new user is created, a unqiue token for the user is created as well
  # that will be the key for the user who wants to use the api
  acts_as_token_authenticatable
end
