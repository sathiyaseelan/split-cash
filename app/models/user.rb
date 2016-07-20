class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,:lockable,
         :recoverable, :rememberable, :trackable, :validatable

    has_many :members
    has_many :groups, through: :members

    def full_name
      "#{first_name} #{last_name}".strip if first_name || last_name
    end

    def self.find_users(search_param)
      User.where("email like ? or first_name like ? or last_name like ?","%#{search_param}%","%#{search_param}%","%#{search_param}%")
    end

    
end
