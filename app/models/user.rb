class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # can remove :registerable to prevent users from signing up
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
