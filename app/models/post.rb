class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  acts_as_votable

  has_attached_file :image, :styles => { :medium => "510x510#", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :image
end
