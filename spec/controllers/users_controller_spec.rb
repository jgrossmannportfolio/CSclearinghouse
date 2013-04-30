require 'spec_helper'

describe UsersController do
	include Devise::TestHelpers
	before(:each) do
		@fake_user = FactoryGirl.create(:user)
		sign_in @fake_user
	end

	describe 'going to a user profile page' do
		it 'should return the user info' do
			fake_user = mock("user1")
			User.should_receive(:find).with("1").and_return(fake_user)
			post :show, {:id => 1}
		end
	end

	describe 'list all users in the data base on the users page' do
    	it 'should pull the users from the model' do
      		User.should_receive(:all)
      		post :index
    	end
  	end
  	describe 'deleting user profiles' do
  		it 'delete a user' do
		    fake_user = mock(User, :username => "fakeuser1", :firstname => "Fake" , :lastname => "User1", :email => "fakeuser1@gmail.com", :id => "1")
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
			fake_user2 = FactoryGirl.build(:user, :username =>'fuser2', :firstname =>'John', :lastname => 'Doe', :email => 'JDoe@colgate.edu')
			User.should_receive(:find).with("#{@fake_user.id}").and_return(@fake_user)
			@tags= @fake_user.stub!(:tags).and_return([])
			put :update, {:id => @fake_user, :firstname => fake_user2.firstname, :lastname => fake_user2.lastname, :email => fake_user2.email, :tag => {:name => ""}, :tags => {}}
			response.should redirect_to(edit_user_path(@fake_user))
			flash[:notice].should == "#{@fake_user.username}'s profile was successfully updated."
		end
	end
end
