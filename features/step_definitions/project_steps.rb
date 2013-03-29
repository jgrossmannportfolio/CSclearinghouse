
Given /the following projects exist/ do |projects_table|
	projects_table.hashes.each do |project|
		Project.create!(project)
	end
	projects_table.hashes.size.should == Project.all.count
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


