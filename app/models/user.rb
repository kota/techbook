class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,:omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :github_user_id, :name
  # attr_accessible :title, :body

  def self.find_or_create_from_auth_hash(auth_hash)
    user_data = auth_hash.extra.raw_info
    if user = User.where(:github_user_id => auth_hash.uid).first
      user
    else # Create a user with a stub password. 
      User.create!(:github_user_id => auth_hash.uid, :name => auth_hash.info.nickname, :email => auth_hash.info.email)
    end
  end

end
