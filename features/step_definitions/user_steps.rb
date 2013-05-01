Given /the following users exist/ do |users_table|
	users_table.hashes.each do |user|
		User.create!(user)
	end
	users_table.hashes.size.should == User.all.count
end

Given /the test users exist/ do
	FactoryGirl.create(:user)
	FactoryGirl.create(:user, username: 'testuser2', firstname: 'user2first', lastname: 'user2last', email: 'user2@gmail.com')
	FactoryGirl.create(:user, username: 'testuser3', firstname: 'user3first', lastname: 'user3last', email: 'user3@yahoo.com')
end

When /I print page/ do
	puts page.body
end

Given /the sort test users exist/ do
	FactoryGirl.create(:user, username: 'atestuser1', firstname: 'buser1first', lastname: 'cuser1last')
	FactoryGirl.create(:user, username: 'btestuser2', firstname: 'cuser2first', lastname: 'auser2last', email: 'user2@colgate.edu')
	FactoryGirl.create(:user, username: 'ctestuser3', firstname: 'auser3first', lastname: 'buser3last', email: 'user3@yahoo.com')
end
	
When /the user (.*) gets confirmed/ do |user|
	user = user.find_by_username(user)
	user.confirmed_at = Time.now
	user.save
end

Then /I should see user details/ do
	user_attr = User.accessible_attributes
	user_attr.each do |attribute|
		attribute = attribute.capitalize
		page.body =~ /#{attribute}/
	end
end

Then /I should not be able to click (.*)/ do |button|
	page.should_not have_button(button)
end
	
Then /I should not be able to follow (.*)/ do |link|
	page.should_not have_link(link)
end

Given /I am signed in as the following authenticated user/ do |user_table|
	user_table.hashes.each do |user|
		visit '/users/sign_in'
		fill_in "user_password", :with => user[:password]
		fill_in "user_login", :with => user[:username]
		click_button "Sign in"
	end
end

Then /I should be signed in as (.*)/ do |username|
	step %{I should see "Signed in as #{username}"}
	step %{I should not see "Login"}
end

Then /I am not signed in/ do
	step %{I should see "Currently not signed in"}
	step %{I should not see "Logout"}
end

	
