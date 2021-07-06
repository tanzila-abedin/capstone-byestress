class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :active_followings, class_name: "Following", #through association 
                               foreign_key: "follower_id", 
                               dependent:   :destroy
  has_many :passive_followings, class_name: "Following", #through association 
                               foreign_key: "followed_id", 
                               dependent:   :destroy
  has_many :following, through: :active_followings, source: :followed
  has_many :followers, through: :passive_followings, source: :follower


  before_save { email.downcase! }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, length: {maximum: 50}
  validates :fullname, presence: true, length: {maximum: 50}

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                         format: { with: VALID_EMAIL_REGEX },
                                            uniqueness: true

  #follows a user
  def follow(other_user)
    following << other_user unless self == other_user
     #active_followings.create(followed_id: other_user.id)
  end

  #unfollows a user
  def unfollows(other_user)
    following.delete(other_user)
    #active_followings.find_by(followed_id: other_user.id).delete
  end

  #returns TRUE if the current user IS following the other user
  def follow?
    following.include?(other_user)
    #!active_followings.find_by(followed_id: other_user.id).nil?   
  end
end
