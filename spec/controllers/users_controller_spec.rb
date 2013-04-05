require 'spec_helper'

describe UsersController do
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
	
end
