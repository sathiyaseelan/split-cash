class Role < ApplicationRecord
  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resource,
             :polymorphic => true,
             :optional => true

  validates :resource_type,
            :inclusion => { :in => Rolify.resource_types },
            :allow_nil => true

  scopify
  
  def self.group_roles
    #Group.find_roles.pluck(:name).uniq
    ['member', 'moderator']
  end
  
  def self.app_roles
    ['admin','user']
  end
end
