class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,:lockable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :first_name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :last_name, presence: true, length: {minimum: 1, maximum: 25 }
  paginates_per 5
  has_many :members
  has_many :groups, through: :members

  def full_name
    "#{first_name} #{last_name}".strip if first_name || last_name
  end

  def self.find_users(search_param)
    User.where("email like ? or first_name like ? or last_name like ?","%#{search_param}%","%#{search_param}%","%#{search_param}%")
  end

  def confirm
    super
    UserMailer.welcome_email(self).deliver_later
    p UserMailer.welcome_email(self).message
  end

end
