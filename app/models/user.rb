class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  has_many :friendships, foreign_key: "me_id", dependent: :destroy
  has_many :friends, through: :friendships


  def befriend(other_user)
    friends << other_user
  end

  def defriend(other_user)
    friends.delete(other_user)
  end

end
