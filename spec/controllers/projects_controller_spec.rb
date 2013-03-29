require 'spec_helper'

describe ProjectsController do
	describe 'going to a project details page' do
		it 'should return the project details' do
			fake_project = mock("project1")
			Project.should_receive(:find).with("1").and_return(fake_project)
			post :show, {:id => 1}
		end
	end
	describe 'creating and deleting projects' do
		it 'should create a new project' do
			ProjectsController.stub(:create).and_return(mock('Project'))
			post :create, {:id => "1"}
		end

		it 'delete a movie' do
	      fake_project = mock(Project, :title => "Fake Project 1", :description => "Fun Stuff" , :owner => "Your mom", :deadline => "12-Dec-2013", :id => "1")
	      Project.stub!(:find).with("1").and_return(fake_project)
	      fake_project.should_receive(:destroy)
	      delete :destroy, {:id => "1"}
	      response.should redirect_to("/projects")
	      flash[:notice].should == "Fake Project 1 deleted."
    	end
	end	
end
