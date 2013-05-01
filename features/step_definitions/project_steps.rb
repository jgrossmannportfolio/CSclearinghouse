
Given /the following projects exist/ do |projects_table|
	projects_table.hashes.each do |project|
		Project.create!(project)
	end
	projects_table.hashes.size.should == Project.all.count
end

Given /the test projects exist/ do
	FactoryGirl.create(:project)
	FactoryGirl.create(:project, title: 'Project5', description: 'Test Project 5', owner: 'Fake Person 2', deadline: '22-Dec-2013')
end
	
Given /(.*) has not created (.*)/ do |username, project_title|
	project = Project.find_by_title(project_title)
	user = User.find_by_username(username)
	if (project.user == user)
		assert false
	end
end

Given /(.*) has created (.*)/ do |username, project_title|
	project = Project.find_by_title(project_title)
	user = User.find_by_username(username)
	user.projects << project
end

When /project (.*) gets approved/i do |project|
	@project = Project.find_by_title(project)
	@project.confirmed_at = Time.now
	@project.save
end

Then /I should see project details/ do
	project_attr = Project.accessible_attributes
	project_attr.each do |attribute|
		attribute = attribute.capitalize
		page.body =~ /#{attribute}/
	end
end

When /^I confirm popup$/ do
	page.click('Confirm')
end

Then /I should see all the projects/ do
	(page.all('table#projects tr').count-1).should == Project.count
end


