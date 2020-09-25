class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :registerable, :trackable,
         :confirmable, :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable
end
