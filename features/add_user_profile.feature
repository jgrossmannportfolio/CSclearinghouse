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
	And I follow Register
	Then I should be on the Register New User Page

Scenario: Add a new user to the website
	 Given I am on the Register New User Page
	 When I fill in "Title" with "Pancakes"
	 And I fill in "Description" with "An incredibly exciting project!"
	 And I fill in "Owner" with "Mrs. Buttersworth"
	 And I fill in "Deadline" with "5-Aug-2013"
	 And I press "Save Changes"
	 Then I should be on the Projects Page
	 And I should see "Pancakes"
	 And I should see "An incredibly exciting project!"
	 And I should see "Mrs. Buttersworth"
	 And I should see "5-Aug-2013"
