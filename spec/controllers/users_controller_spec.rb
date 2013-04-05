require 'spec_helper'

describe UsersController do
	describe 'going to a user profile page' do
		it 'should return the user info' do
			fake_user = mock("user1")
			User.should_receive(:find).with("1").and_return(fake_user)
			post :show, {:id => 1}
		end
	end
	
	
end
