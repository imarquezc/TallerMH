class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :rememberable, :validatable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable
end
