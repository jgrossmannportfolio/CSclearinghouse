class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
		:recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :firstname, :lastname, :aboutme, :username, :tag_ids, :project_ids
	attr_accessible :reset_password_token, :confirmed_at

	has_many :projects, :dependent => :destroy
	has_many :notifications, :dependent => :destroy
	has_and_belongs_to_many :tags
	has_one :admin_notification, :dependent => :destroy

	#virtual attribute for authenticating by either username or email
  attr_accessor :login
	attr_accessible :login
	validates_uniqueness_of :username
 
	#hacking devise to ensure user does not recieve confirmation email
	#until admin clears them
	def confirmation_required?
		false
	end
	def active_for_authentication?
		confirmed? || confirmation_period_valid?
	end

	def self.unconfirmed_user(user)
		@user = user
		@notification = AdminNotification.create!(:message => "#{@user.firstname} #{@user.lastname} wishes to register for the CSclearinghouse! Confirm or deny the account please!", :admin_type => "user")
		user.admin_notification = @notification
		user.save!
	end

	def self.confirm_user(params)
		@user = User.find(params[:user])
		if params[:status] == "true"
			if @user.confirmation_token == nil
				@user.confirmation_token
			end
			@user.send_confirmation_instructions
			#@user.confirmed_at = Time.now
			#@user.save!
		else
			@user.destroy
		end
	end

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
