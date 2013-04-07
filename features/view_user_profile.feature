Feature: See the profile of a specific user

As a project owner
So that I can check the credentials of a user
I want to be able to view the profile of a user

Background:
	Given the following users exist:
		| username | firstname | lastname | email |
		|testuser1 |user1first |user1last |user1@gmail.com|
		|testuser2 |user2first |user2last |user2@colgate.edu|
		|testuser3 |user3first |user3last |user3@yahoo.com|

Scenario: View a user's profile
	Given I am on the users page
	When I follow "More about testuser2"
	Then I should be on the profile page for testuser2
	And I should see user details
