class User < ActiveRecord::Base

  has_many :friends
  has_many :credits, :through => :friends

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end


end