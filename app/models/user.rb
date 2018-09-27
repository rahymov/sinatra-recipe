class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :full_name, :username,:email
  has_many :recipes
  def slug
    username.downcase.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    User.all.find{|para| para.slug == slug}
  end
end
