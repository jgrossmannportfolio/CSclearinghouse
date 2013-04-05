Feature: add a user to the website

As a visitor to the website
So that I can advertise my credentials or post a project
I want to have a profile on the website filled out with my personal information

Background:
	Given the following users exist:
		| username | firstname | lastname | email |
		|testuser1 |user1first |user1last |user1@gmail.com|
		|testuser2 |user2first |user2last |user2@colgate.edu|
		|testuser3 |user3first |user3last |user3@yahoo.com|

Scenario: Add a new user to the website
	Given I am on the Home Page
	When I follow "Register"
	Then I should be on the Register New User Page

Scenario: Add a new user to the website
	 Given I am on the Register New User Page
	 When I fill in "Username" with "testuser4"
	 And I fill in "First Name" with "user4first"
	 And I fill in "Last Name" with "user4last"
	 And I fill in "Email" with "user4@yahoo.com"
	 And I press "Register!"
	 Then I should be on the Users Page
	 And I should see "testuser4"
	 And I should see "user4first"
	 And I should see "user4last"
	 And I should see "user4@yahoo.com"
