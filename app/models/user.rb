class User < ApplicationRecord
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         def generate_jwt
          JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.credentials.jwt_secret_key)
        end
       

        #  validates :email, presence: true, uniqueness: true
end
