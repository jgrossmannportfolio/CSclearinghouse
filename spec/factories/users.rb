FactoryGirl.define do
	factory :user do
		username 'testuser1'
		firstname 'user1first'
		lastname 'user1last'
		email 'user1@gmail.com'
		password 'password'
		password_confirmation 'password'
		confirmed_at Time.now
	end
end
