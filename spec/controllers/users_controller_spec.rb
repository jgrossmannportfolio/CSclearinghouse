require 'spec_helper'

describe UsersController do
	describe 'going to a user profile page' do
		it 'should return the user info' do
			fake_user = mock("user1")
			User.should_receive(:find).with("1").and_return(fake_user)
			post :show, {:id => 1}
		end
	end
	
	describe 'updating a user profile page' do
		before :each do
			@fake_user = FactoryGirl.create(:user)
		end
		it 'should access the user information to edit' do
			User.should_receive(:find).with("#{@fake_user.id}").and_return(@fake_user)
			post :edit, {:id => @fake_user.id}
		end

		it 'should update the user information in the database' do
			fake_user2 = FactoryGirl.build(:user, :username =>'fuser2', :firstname =>'John', :lastname => 'Doe', :email => 'JDoe@colgate.edu')
			User.should_receive(:find).with("#{@fake_user.id}").and_return(@fake_user)
			put :update, {:id => @fake_user, :firstname => fake_user2.firstname, :lastname => fake_user2.lastname, :email => fake_user2.email}
			flash[:notice].should == "#{@fake_user.username}'s profile was successfully updated."
		end
	end
end
