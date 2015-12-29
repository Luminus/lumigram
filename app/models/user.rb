class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :comments
  acts_as_voter

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "50x50#" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :username, presence: true, uniqueness: { case_sensitive: false, message: "That username is already taken" }
  validates_presence_of :avatar
end
