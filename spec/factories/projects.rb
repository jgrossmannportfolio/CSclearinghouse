FactoryGirl.define do
	factory :project do
		title 'Project4'
		description 'Test Project 4'
		owner 'Fake Person 1'
		deadline '21-Dec-2012'
		confirmed_at Time.now
	end
end
