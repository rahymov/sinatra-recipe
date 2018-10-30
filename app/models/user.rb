class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :full_name,:email, :username
  validates_uniqueness_of :username
  has_many :recipes

  # def slug
  #   username.downcase.gsub(" ","-")
  # end
  #
  # def self.find_by_slug(slug)
  #   User.all.find{|para| para.slug == slug}
  # end
end
