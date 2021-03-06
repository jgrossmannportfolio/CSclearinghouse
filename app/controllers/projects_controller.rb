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
		if ordering != 'deadline'
			ordering = "lower(#{ordering})" unless ordering == nil
		end
		if params[:search_string] != nil
			attrib = params[:search_type][:selected]
			search = params[:search_string]
			@projects = Project.where("projects.confirmed_at IS NOT NULL").order(ordering).search(search,attrib)
		else
			@projects = Project.where("projects.confirmed_at IS NOT NULL").order(ordering)
		end
		if @projects == nil
			flash[:notice] = "Your search returned no matches."
		end
	end
	
	def show  
		confirmed_project(params[:id])
		id = params[:id]
    	@project = Project.find(id)
		@update_and_delete = (@project.user == current_user)		
	end
	
	def new
    if params[:tags] == nil
      @tags = ""
    else
      #FIX IT SO THAT A TAG WITH A SPACE DOES NOT GET TURNED INTO 2 TAGS
      @tags = params[:tags].split(",")
      if(params[:deletetag] != nil)
        @tags.delete(:deletetag)
      else
        @tags << params[:tag]
      end
    end
    render :partial => "shared/project_tags", :@tags => @tags and return if request.xhr?
	end

	def deadline_validator(deadline)
		if deadline =~ /^([0-9][0-9])-([0-9][0-9])-([0-9][0-9][0-9][0-9])$/
			if Date.parse(deadline) <= Date.today
				return false
			else
				return true
			end
		else
			return false
		end
	end

	def create
		if !deadline_validator(params[:project][:deadline])
			flash[:notice] = "Invalid deadline."
			redirect_to new_project_path
		else
			@project = Project.create!(params[:project])
	 		@user = current_user
			@project.owner = @user.username
			@project.save!
			# Project.unconfirmed_project(@project, @user)
      # This will make it so projects need to be authorized, get rid of line below
      @project.confirmed_at = Time.now
      if (params[:tags] != nil && params[:tags].size != 0)
        @tags = params[:tags].split(" ")
        @tags.each do |tag|
          if @tag = Tag.find_by_name(tag)
						@project.tags << @tag
					else
				    @project.tags.create!(:name => tag)
          end
        end
			end
			@user.projects << @project
          flash[:notice] = "Your project: '#{@project.title}', was just created!"
	    	# flash[:notice] = "'#{@project.title}' was submitted to an administrator for approval. You will receive notification once confirmed or denied."
	    	redirect_to projects_path
	  end
	end

  def edit
    @project = Project.find params[:id] 
	  @tags = @project.tags
  end

  def update
  	if !deadline_validator(params[:project][:deadline])
			flash[:notice] = "Invalid deadline."
			redirect_to edit_project_path
	else
		  confirmed_project(params[:id])
	      @project = Project.find params[:id] 
	      @project.update_attributes! params[:project] 
				if(params[:tags] != nil)
					tags = params[:tags].keys
					tags.each do |tag|
						@project.tags.find_by_name(tag).delete
					end
				end
				if(params[:tag][:name] != '' && params[:tag][:name] != nil && @project.tags.find_by_name(params[:tag][:name]) == nil)
					if @tag = Tag.find_by_name(params[:tag][:name])
						@project.tags << @tag
					else
						@project.tags.create!(params[:tag])
					end
				end
				@tags = @project.tags
	      flash[:notice] = "#{@project.title} was successfully updated."
	      redirect_to project_path(@project)
  	end
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
