
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
	
Given /I create unconfirmed projects/ do
	visit '/projects/new'
	fill_in "Title", :with => "testproject"
	fill_in "Description", :with => "test unconfirmed project"
	fill_in "Owner", :with => "testman"
	fill_in "Deadline (dd/mm/yyyy)", :with => "01/01/2013"
	fill_in "Tag", :with => "test tag"
	click_on "Create Project"
	visit '/projects/new'
	fill_in "Title", :with => "test2project"
	fill_in "Description", :with => "test unconfirmed project2"
	fill_in "Owner", :with => "testman2"
	fill_in "Deadline (dd/mm/yyyy)", :with => "02/01/2013"
	fill_in "Tag", :with => "test tag2"
	click_on "Create Project"
end

Given /the sort test projects exist/ do
	FactoryGirl.create(:project, title: 'Project4', description: "This is john's", owner: 'John', deadline: "May-10-2013")
	FactoryGirl.create(:project, title: 'Project5', description: "sean's project", owner: "Sean", deadline: "Jun-03-2014")
	FactoryGirl.create(:project, title: "Sixth proj", description: "Tom's project", owner: "Tom", deadline: "Jun-03-1992")
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

Then /I should see details for (.*)/ do |title|
		project = Project.find_by_title(title)
		assert page.body =~ /#{project.title}/
		assert page.body =~ /#{project.description}/
		assert page.body =~ /#{project.owner}/
		assert page.body =~ /#{project.deadline.to_formatted_s(:long) unless project.deadline == nil}/
		project.tags.each do |tag|
			assert page.body =~ /#{tag.name}/
		end
end

When /^I confirm popup$/ do
	page.click('Confirm')
end

Then /I should see all the projects/ do
	Project.all.each do |p|
		assert page.body =~ /#{p.title}/
	end
end

When /I follow "(.*)" for "(.*)"/ do |link, project_title|
	parent = "div#main div.content div#project#{Project.find_by_title(project_title).id}.project"
  step "I follow \"#{link}\" within \"#{parent}\""
end

