Given /the following users exist/ do |users_table|
	users_table.hashes.each do |user|
		User.create!(user)
	end
	users_table.hashes.size.should == User.all.count
end

Then /I should see user details/ do
	user_attr = User.accessible_attributes
	user_attr.each do |attribute|
		attribute = attribute.capitalize
		page.body =~ /#{attribute}/
	end
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

	
