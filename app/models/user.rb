class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,:lockable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :members
  has_many :groups, through: :members
end
