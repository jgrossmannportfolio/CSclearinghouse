require 'spec_helper'

describe UsersController do
	include Devise::TestHelpers
	before(:each) do
		@fake_user = FactoryGirl.create(:user)
		sign_in @fake_user
		controller.stub!(:sign_in_status_message)
		controller.stub!(:auth_user)
	end

	describe 'going to a user profile page' do
		it 'should return the user info' do
			controller.stub!(:confirmed_user).with("1")
			fake_user = mock("user1")
			User.should_receive(:find).with("1").and_return(fake_user)
			post :show, {:id => 1}
		end
	end

      describe 'should order the users based on current sort' do
				it 'when sort is -username-' do
					session[:usersort] = 'username'
					User.stub_chain(:where, :order)
					post :index, {:usersort=>'username'}
				end
				it 'when sort is -firstname-' do
					User.stub_chain(:where, :order)
					session[:usersort] = 'firstname'
					post :index, {:usersort=>'firstname'}
				end
				it 'when sort is -lastname-' do
					User.stub_chain(:where, :order)
					session[:usersort] = 'lastname'
					post :index, {:usersort=>'lastname'}
				end
				it 'when sort is -email-' do
					User.stub_chain(:where, :order)
					session[:usersort] = 'email'
					post :index, {:usersort=>'email'}
				end
			it 'should update the session if params and session sort are not =' do
				post :index, {:usersort=>'firstname'}
				response.should redirect_to("/users?usersort=firstname")
				assigns(:session['firstname']).should_not be_nil
			end
  end

  	describe 'deleting user profiles' do
  		it 'delete a user' do
		    fake_user = mock(User, :username => "fakeuser1", :firstname => "Fake" , :lastname => "User1", :email => "fakeuser1@gmail.com", :id => "1")
				fake_user.should_receive(:admin_notification).and_return(nil)
		    User.stub!(:find).with("1").and_return(fake_user)
		    fake_user.should_receive(:destroy)
		    delete :destroy, {:id => "1"}
		    response.should redirect_to("/users")
		    flash[:notice].should == "#{fake_user.username} deleted."
    	end
  	end
	

	describe 'updating a user profile page' do
		it 'should access the user information to edit' do
			User.should_receive(:find).with("#{@fake_user.id}").and_return(@fake_user)
			post :edit, {:id => @fake_user.id}
		end

		it 'should update the user information in the database' do
			controller.stub!(:confirmed_user).with("#{@fake_user.id}")
			fake_user2 = FactoryGirl.build(:user, :username =>'fuser2', :firstname =>'John', :lastname => 'Doe', :email => 'JDoe@colgate.edu')
			User.should_receive(:find).with("#{@fake_user.id}").and_return(@fake_user)
			@fake_user.stub!(:update_attributes).and_return(true)
			@tags= @fake_user.stub!(:tags).and_return([])
			put :update, {:id => @fake_user.id, :firstname => fake_user2.firstname, :lastname => fake_user2.lastname, :email => fake_user2.email, :tag => {:name => ""}, :tags => {}}
			response.should redirect_to(edit_user_path(@fake_user))
			flash[:notice].should == "#{@fake_user.username}'s profile was successfully updated."
		end
	end
end
