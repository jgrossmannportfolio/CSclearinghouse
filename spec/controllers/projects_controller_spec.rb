require 'spec_helper'

describe ProjectsController do
	include Devise::TestHelpers
	before(:each) do
		@fake_user = FactoryGirl.create(:user)
		sign_in @fake_user
	end
		
	describe 'going to a project details page' do
		before do
			fake_project = mock("project1")
		end
		it 'should return the project details' do
			controller.stub!(:confirmed_project).with("1")
			Project.should_receive(:find).with("1").and_return(@fake_project)
			@project.stub(:user).and_return(@fake_user)
			post :show, {:id => 1}
		end
	end

	describe 'updating a project' do
		it 'should update a project' do
			@fake_project = mock(Project, :title => "project1", :id =>"1", :deadline => "08-09-2014", :owner => @fake_user.username)
			params = {:project=> {:deadline => "08-08-2014"} }
			controller.stub!(:deadline_validator).with(params).and_return(true)
			controller.stub!(:confirmed_project).with("1")
			Project.stub!(:find).with("1").and_return(@fake_project)
			@fake_project.stub!(:update_attributes!).with(@fake_project).and_return(true)
			@tags = @fake_project.stub!(:tags).and_return([])
      		put :update, {:id => "1", :project => @fake_project, :tag => {:name => ""}, :tags => {}, :deadline => "08-08-2014", :owner => "testuser1"}
     		response.should redirect_to(project_path(@fake_project))
     		flash[:notice].should == "project1 was successfully updated."
		end
	end

	describe 'creating and deleting projects' do
		it 'should create a new project' do
			controller.stub!(:deadline_validator).with([:project =>[:deadline => "09-09-2014"]]).and_return(true)
			ProjectsController.stub(:create).and_return(mock('Project'))
			post :create, {:id => "1", :tag => {:name => ""}, :deadline => "08-08-2014", :owner => @fake_user.username}
		end

		it 'delete a project' do
		    fake_project = mock(Project, :title => "Fake Project 1", :description => "Fun Stuff" , :owner => "Mickey Mouse", :deadline => "12-Dec-2013", :id => "1")
		    Project.stub!(:find).with("1").and_return(fake_project)
				fake_project.stub!(:admin_notification).and_return(nil)
				AdminNotification.stub!(:project_destroy_message).with(fake_project)
		    fake_project.should_receive(:destroy)
		    delete :destroy, {:id => "1"}
		    response.should redirect_to("/projects")
		    flash[:notice].should == "Fake Project 1 deleted."
    	end
	end	
			describe 'should order the projects based on current sort' do
				it 'when sort is -title-' do
					session[:projectsort] = 'title'
					Project.stub_chain(:where, :order)
					post :index, {:projectsort=>'title'}
				end
				it 'when sort is -owner-' do
					Project.stub_chain(:where, :order)
					session[:projectsort] = 'owner'
					post :index, {:projectsort=>'owner'}
				end
				it 'when sort is -deadline-' do
					Project.stub_chain(:where, :order)
					session[:projectsort] = 'deadline'
					post :index, {:projectsort=>'deadline'}
				end
			end
			it 'should update the session if params and session sort are not =' do
				post :index, {:projectsort=>'owner'}
				response.should redirect_to("/projects?projectsort=owner")
				assigns(:session['owner']).should_not be_nil
			end
		
end
