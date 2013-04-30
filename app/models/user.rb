class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :firstname, :lastname, :aboutme, :username, :tag_ids, :project_ids
	attr_accessible :reset_password_token

	has_many :projects, :dependent => :destroy
	has_and_belongs_to_many :tags

	#virtual attribute for authenticating by either username or email
  attr_accessor :login
	attr_accessible :login
	validates_uniqueness_of :username

	#creating log_in authentication by username or email
	def self.find_first_by_auth_conditions(warden_conditions)
		conditions = warden_conditions.dup
		if login = conditions.delete(:login)
			where(conditions).where(["lower(username) = :value OR lower(email) = :value", {:value => login.downcase}]).first
		else
			where(conditions).first
		end
	end

	
end
