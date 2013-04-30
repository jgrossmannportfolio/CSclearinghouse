Given /the following tags exist:/ do |tag_table|
	tag_table.hashes.each do |tag|
		Tag.create!(tag)
	end
	assert tag_table.hashes.size.should == Tag.all.count
end
