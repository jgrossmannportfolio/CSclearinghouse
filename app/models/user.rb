class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
		:recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :firstname, :lastname, :aboutme, :username, :tag_ids, :project_ids
  attr_accessible :reset_password_token, :confirmed_at, :avatar, :resume, :phone
  attr_accessible :shortdescription, :graduatingyear, :major1, :major2, :minor, :usertype
  attr_accessible :jobtitle, :organization

	has_many :projects, :dependent => :destroy
	has_many :notifications, :dependent => :destroy
	has_and_belongs_to_many :tags
	has_one :admin_notification, :dependent => :destroy

	mount_uploader :avatar, AvatarUploader
	mount_uploader :resume, ResumeUploader

	validates_presence_of :firstname
	validates_presence_of :lastname
	#virtual attribute for authenticating by either username or email
  attr_accessor :login
	attr_accessible :login
	validates_uniqueness_of :username
  validates_uniqueness_of :email
	validates :phone, :allow_blank => true, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Bad Phone Number Format"}
 
	#hacking devise to ensure user does not recieve confirmation email
	#until admin clears them
	def confirmation_required?
		false
	end
	def active_for_authentication?
		confirmed? || confirmation_period_valid?
	end

	def self.unconfirmed_user(user)
    #uncomment when you want admin to confirm each user via admin dashboard comment out
		#confirmed_at line
		#@user = user
		#@notification = AdminNotification.new_user_message(@user)
		#user.admin_notification = @notification
		user.confirmed_at = Time.now
		user.save!
	end

	def self.confirm_user(params)
		@user = User.find(params[:user])
		if params[:status] == "true"
			if @user.confirmation_token == nil
				@user.confirmation_token
			end
			UserMailer.welcome_email(@user).deliver
			@notificaiton = Notification.welcome_message(@user)
			@user.notifications << @notification
			@user.confirmed_at = Time.now
			@user.save!
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

	


	#simple user search method
	def self.search(search,category)
		if search
			if category =~ /tags/i 
				tag = Tag.find_by_name(search)
				tag.users
			else
				find(:all, :conditions => ["LOWER(#{category}) LIKE ?","%#{search.downcase}%"])
			end
		else
			find(:all)
		end
	end
end
