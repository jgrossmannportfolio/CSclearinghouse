class UsersController < ApplicationController
	before_filter :auth_user
	def index 
		usersort = params[:usersort] || session[:usersort]
    case usersort
    when 'username'
    	ordering,@username_header = :username, 'hilite'
    when 'first_name'
    	ordering,@first_name_header = :firstname, 'hilite'
    when 'last_name'
      ordering,@last_name_header = :lastname, 'hilite'
    when 'email'
      ordering,@email_header = :email, 'hilite'
    end
    	
    if params[:usersort] != session[:usersort]
      session[:usersort] = usersort
			flash.keep
      redirect_to :usersort => usersort and return
    end
    @users = User.order(ordering)
	end
	
	def show
		id = params[:id]
		@user = User.find(id)
		@edit_and_delete = (@user == current_user)
	end
	
	def edit
		id = params[:id]
		@user = User.find(id)
	end

	def new
	end

	#def create
	#	@user = User.create!(params[:user])
   # 	flash[:notice] = "Congratulations #{@user.username}! You have
   # 	sucessfully registered to the CS clearinghouse!"
   # 	redirect_to users_path
	#end

	def update
  	@user = User.find params[:id]
	  @user.update_attributes!(params[:user])
	  flash[:notice] = "#{@user.username}'s profile was successfully updated."
	  redirect_to user_path(@user)
  end

	def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	flash[:notice] = "#{@user.username} deleted."
  	redirect_to users_path
  end
end

