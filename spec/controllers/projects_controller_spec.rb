require 'spec_helper'

describe ProjectsController do
	describe 'going to a project details page' do
		it 'should return the project details' do
			fake_project = mock("project1")
			Project.should_receive(:find).with("1").and_return(fake_project)
			post :show, {:id => 1}
		end
	end
	describe 'creating a new project' do
		it 'should create a new project' do
			ProjectsController.stub(:create).and_return(mock('Project'))
			post :create, {:id => "1"}
		end
	end
end
