class UsersController < ApplicationController
	before_filter :auth_user
	def index
		usersort = params[:usersort] || session[:usersort]
	case usersort
    when 'username'
    	ordering,@username_header = :username, 'hilite'
    when 'firstname'
    	ordering,@first_name_header = :firstname, 'hilite'
    when 'lastname'
      ordering,@last_name_header = :lastname, 'hilite'
    when 'email'
      ordering,@email_header = :email, 'hilite'
    end
    if params[:usersort] != session[:usersort]
    	session[:usersort] = usersort
			flash.keep
    	redirect_to :usersort => usersort and return
    end
		if ordering != 'deadline'
			ordering = "lower(#{ordering})" unless ordering == nil
		end
		if params[:search_string] != nil
			attrib = params[:search_type][:selected]
			search = params[:search_string]
    		@users = User.where("users.confirmed_at IS NOT NULL").order(ordering).search(search,attrib)
    	else
    		@users = User.where("users.confirmed_at IS NOT NULL").order(ordering)
    	end
	end
	
	def show
		confirmed_user(params[:id])
		id = params[:id]
		@user = User.find(id)
    render :partial => "shared/skill_tags", :@user => @user and return if request.xhr?
		@edit_and_delete = (@user == current_user)
		@current_user_projects = current_user.projects.where("confirmed_at IS NOT NULL")
    @current_user_projects = @current_user_projects.map {|project| [project.title, project.id] }
		@resume = (@user.resume_url.present? ? @user.resume_url : "No Resume Uploaded")
		@major = nil
    @major = "#{@user.major1}" if @user.major1?
		@major = @major + " and #{@user.major2}" if @user.major2?
		if(@user.organization?)
			if(@user.jobtitle?)
				@organization = "#{@user.organization} | #{@user.jobtitle}"
			else
				@organization = @user.organization
			end
		elsif(@user.jobtitle?)
			@organization = @user.jobtitle
		end
	end
	
	def edit
		id = params[:id]
		@user = User.find(id)
		if @user != current_user
			redirect_to root_path
		end
		@tags = @user.tags
		@usertype = @user.usertype.gsub(/\s+/,"_")
		@avatar = @user.avatar_url(:avatar)
    @year = Time.now.year
    @years = [@year, @year+1, @year+2, @year+3, @year+4]
	  @years = @years.collect{|i| i.to_s}
		@editblock = params[:editblock]
		render :partial => "shared/edit_#{@usertype}_account_#{@editblock}.html.haml", :@user => @user, :@usertype => @usertype, :@years => @years and return if request.xhr?
	end

	def new
		flash[:notice] = "Your account was sent to an administrator. You will be notified and be able to login once reviewed."
		flash.keep
		redirect_to '/home'
	end
	
	def update
			confirmed_user(params[:id])
	    @user = User.find params[:id]
			if(params[:cancel])
				redirect_to user_path(@user)
			else
				if(params[:deletetag] != nil)
					@user.tags.find_by_name(params[:deletetag]).delete
					render nothing: true and return
				end
 				if(params[:skilltag] != nil && @user.tags.find_by_name(params[:skilltag]) == nil)
					if @tag = Tag.find_by_name(params[:skilltag])
						@user.tags << @tag
					else
						@user.tags.create!([{:name => params[:skilltag]}])
					end
					render nothing: true and return
				end
				@tags = @user.tags
	    	if(@user.update_attributes(params[:user]))
					if params[:password_confirmation]
						redirect_to edit_user_registration_path
					end
	    		flash[:notice] = "#{@user.username}'s profile was successfully updated."
          redirect_to user_path(@user)
				else
					flash[:notice] = "Bad Phone Number Format"
					redirect_to edit_user_path(@user)
				end
			end
  	end

	def destroy
    @user = User.find(params[:id])
		if @notification = @user.admin_notification
			@notification.destroy
		end
		AdminNotification.user_destroy_message(@user)
    @user.destroy
    flash[:notice] = "#{@user.username} deleted."
    redirect_to users_path
  end

	def confirmed_user(id)
		if(!User.find(id).confirmed_at)
			flash[:notice] = "This is an invalid project address"
			redirect_to '/users'
		end
	end

end

