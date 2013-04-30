class AdminUser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
	attr_accessor :login
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me, :login
  # attr_accessible :title, :body


	def self.find_for_database_authentication(warden_conditions)
		conditions = warden_conditions.dup
		login = conditions.delete(:login)
		where(conditions).where(["lower(email) = :value", { :value=>login.strip.downcase }]).first
	end
end
