class ProjectsController < ApplicationController
	before_filter :auth_user
	def index
		@projects = Project.all
	end
	
	def show   
		id = params[:id]
    @project = Project.find(id)
		@update_and_delete = (@project.user == current_user)		
	end
	
	def new
	end

	def create
		@project = Project.create!(params[:project])
		if (params[:tag][:name] != '' && params[:tag][:name] != nil)
			@project.tags.create!(params[:tag])
		end
		@user = current_user
		@user.projects << @project
    	flash[:notice] = "#{@project.title} was successfully created."
    	redirect_to projects_path
	end

  def edit
      @project = Project.find params[:id] 
			@tags = @project.tags
  end

  def update
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
      redirect_to edit_project_path(@project)
  end

	def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "#{@project.title} deleted."
    redirect_to projects_path
  end
end
