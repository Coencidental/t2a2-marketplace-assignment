class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :assign_default_role
  has_many :buckets, dependent: :destroy

  def assign_default_role
    add_role(:user)
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
