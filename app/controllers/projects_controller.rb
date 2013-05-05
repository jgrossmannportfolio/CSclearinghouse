class ProjectsController < ApplicationController
	before_filter :auth_user
	def index
		projectsort = params[:projectsort] || session[:projectsort]
    case projectsort
    when 'title'
      ordering,@title_header = :title, 'hilite'
    when 'owner'
      ordering,@owner_header = :owner, 'hilite'
    when 'deadline'
      ordering,@deadline_header = :deadline, 'hilite'
    end
    if params[:projectsort] != session[:projectsort]
      session[:projectsort] = projectsort
      flash.keep
      redirect_to :projectsort => projectsort and return
    end
		ordering = "lower(#{ordering})" unless ordering == nil
		if params[:search_string] != nil
			attrib = params[:search_type][:selected]
			search = params[:search_string]
			@projects = Project.where("projects.confirmed_at IS NOT NULL").order(ordering).search(search,attrib)
		else
			@projects = Project.where("projects.confirmed_at IS NOT NULL").order(ordering)
		end
		
    	

	end
	
	def show  
		confirmed_project(params[:id])
		id = params[:id]
    	@project = Project.find(id)
		@update_and_delete = (@project.user == current_user)		
	end
	
	def new
		@user = current_user
		@project = Project.new :owner => @user.username
	end

	def deadline_validator(month, day)
		current_month = Time.now.month
		current_day = Time.now.day
		if month <= current_month
			if day < current_day
				return false
			end
		end
		return true
	end

	def create
		#if !deadline_validator(params[:project][:deadline(2i)],params[:project][:deadline(3i)])
			#redirect_to new_projects_path
		#else
			@project = Project.create!(params[:project])
			@user = current_user
			Project.unconfirmed_project(@project, @user)
			if (params[:tag][:name] != '' && params[:tag][:name] != nil)
				@project.tags.create!(params[:tag])
			end
			@user.projects << @project
	    	flash[:notice] = "'#{@project.title}' was submitted to an administrator for approval. You will receive notification once confirmed or denied."
	    	redirect_to projects_path
	    #end
	end

  def edit
      @project = Project.find params[:id] 
			@tags = @project.tags
  end

  def update
			confirmed_project(params[:id])
      @project = Project.find params[:id] 
      @project.update_attributes! params[:project] 
			if(params[:tags] != nil)
				tags = params[:tags].keys
				tags.each do |tag|
					@project.tags.find_by_name(tag).delete
				end
			end
			if(params[:tag][:name] != '' && params[:tag][:name] != nil)
				@project.tags.create!(params[:tag])
			end
			@tags = @project.tags
      flash[:notice] = "#{@project.title} was successfully updated."
      redirect_to project_path(@project)
  end

	def destroy
    @project = Project.find(params[:id])
		if @project.admin_notification != nil
			@project.admin_notification.destroy
		end
		AdminNotification.project_destroy_message(@project)
    @project.destroy
    flash[:notice] = "#{@project.title} deleted."
    redirect_to projects_path
  end

	def confirmed_project(id)
		if(!Project.find(id).confirmed_at)
			flash[:notice] = "This is an invalid project address"
			redirect_to '/projects'
		end
	end

end
