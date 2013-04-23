require 'spec_helper'

describe ProjectsController do
	include Devise::TestHelpers
	before(:each) do
		@fake_user = FactoryGirl.create(:user)
		sign_in @fake_user
	end
		
	describe 'going to a project details page' do
		it 'should return the project details' do
			fake_project = mock("project1")
			Project.should_receive(:find).with("1").and_return(@fake_project)
			@project.stub(:user).and_return(@fake_user)
			post :show, {:id => 1}
		end
	end
	describe 'updating a project' do
		it 'should update a project' do
			@fake_project = mock(Project, :title => "project1", :id =>"1")
			Project.stub!(:find).with("1").and_return(@fake_project)
			@fake_project.stub!(:update_attributes!).and_return(true)
      		put :update, {:id => "1", :project => @fake_project, :tag => {:name => ""}}
     		response.should redirect_to(project_path(@fake_project))
     		flash[:notice].should == "project1 was successfully updated."
		end
	end

	describe 'creating and deleting projects' do
		it 'should create a new project' do
			ProjectsController.stub(:create).and_return(mock('Project'))
			post :create, {:id => "1", :tag => {:name => ""}}
		end

		it 'delete a project' do
		    fake_project = mock(Project, :title => "Fake Project 1", :description => "Fun Stuff" , :owner => "Your mom", :deadline => "12-Dec-2013", :id => "1")
		    Project.stub!(:find).with("1").and_return(fake_project)
		    fake_project.should_receive(:destroy)
		    delete :destroy, {:id => "1"}
		    response.should redirect_to("/projects")
		    flash[:notice].should == "Fake Project 1 deleted."
    	end
	end	

	describe 'list all projects in the data base on the projects page' do
    	it 'should pull the projects from the model' do
      		Project.should_receive(:all)
      		post :index
    	end
  	end
end
