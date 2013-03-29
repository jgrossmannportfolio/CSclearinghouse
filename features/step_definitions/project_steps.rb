
Given /the following projects exist/ do |projects_table|
	projects_table.hashes.each do |project|
		Project.create!(project)
	end
	projects_table.hashes.size.should == Project.all.count
end

<<<<<<< HEAD
Then /I should see project details/ do
	project_attr = Project.accessible_attributes
	project_attr.each do |attribute|
		attribute = attribute.capitalize
		page.body =~ /#{attribute}/
	end
end
=======
#Then /I should see all of the projects/ do
>>>>>>> addproject
