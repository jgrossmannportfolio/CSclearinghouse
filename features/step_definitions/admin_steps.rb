Given /I am not logged in as an admin/ do
		step %{I go to the admin dashboard}
		if page.has_content?('Logout')
			click_link('Logout')
		end
end

Given /the test admins exist/ do
	FactoryGirl.create(:admin_user)
	FactoryGirl.create(:admin_user, email: 'testadmin2@gmail.com')
end

Given /I am logged in as an admin/ do
	step %{I go to the admin dashboard}
	step %{I should see "Logout"}
	step %{I should see "Dashboard"}
end
Given /I am logged in as the following authenticated admin/i do |admin_table|
	admin_table.hashes.each do |admin|
		visit '/admin/login'
		fill_in "admin_user_login", :with => admin[:email]
		fill_in "admin_user_password", :with => admin[:password]
		click_button "Login"
	end
end

Given /the following admins exist/ do |admin_table|
	admin_table.hashes.each do |admin|
		AdminUser.create!(admin)
	end
	admin_table.hashes.size.should == AdminUser.all.count
end

When /I follow (.*) for admin user (.*)/ do |link, user|
	within("tr#user_#{User.find_by_username(user).id}") do
		click_link(link)
	end
end

When /I follow (.*) for admin tag (.*)/ do |link, tag|
	within("tr#tag_#{Tag.find_by_name(tag).id}") do
		click_link(link)
	end
end

When /I follow (.*) for admin adminuser (.*)/ do |link, email|
	within("tr#admin_user_#{AdminUser.find_by_email(email).id}") do
		click_link(link)
	end
end

When /I follow (.*) for admin project (.*)/ do |link, project|
	within("tr#project_#{Project.find_by_title(project).id}") do
		click_link(link)
	end
end

Then /I should be logged in as an admin/ do
	step %{I go to the admin dashboard}
	step %{I should see "Logout"}
	step %{I should see "Dashboard"}
	step %{I should not see "Login"}
end

Then /I should not be logged in as an admin/ do 
	step %{I go to the admin dashboard}
	step %{I should be on the admin login page}
end

