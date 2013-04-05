Feature: Edit a user profile

As a user
So I can update my user credentials and information
I want to edit my user profile

Background:
	Given the following users exist:
		| username | firstname | lastname | email |
		|testuser1 |user1first |          |user1@gmail.com|
		|testuser2 |user2first |user2last |user2@colgate.edu|
		|testuser3 |user3first |user3last |user3@yahoo.com|

Scenario: Go to edit profile page
	Given I am on the profile page for testuser1
	When I follow "Edit"
	Then I should be on the edit profile page for testuser1

Scenario: Edit a user's profile page
	Given I am on the edit profile page for testuser1
	When I fill in "Last Name" with "user1last"
	And I press "Update Profile Page"
	Then I should be on the profile page for testuser1
	And I should see "user1last"

