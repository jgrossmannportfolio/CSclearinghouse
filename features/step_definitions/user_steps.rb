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
