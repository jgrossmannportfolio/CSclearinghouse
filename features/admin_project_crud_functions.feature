Feature: CRUD functions for admins on projects

As a website administrator
So I can regulate the projects on the website
I wish to implement crud functions for projects

Background:
	Given the following users exist:
		| username | firstname | lastname | email           | password | password_confirmation|
		|testuser1 |user1first |user1last |user1@gmail.com  | password | password             |
		|testuser2 |user2first |user2last |user2@colgate.edu| password | password             |
		|testuser3 |user3first |user3last |user3@yahoo.com  | password | password             |
	Given the following projects exist: 
		| title       | description    | owner         | deadline    |
    | Project4    | Test Project 4 | Fake Person 1 | 21-Dec-2012 |
    | Project5    | Test Project 5 | Fake Person 2 | 21-Dec-2012 |
	Given the following admins exist:
		|	email							|password|
		|testadmin@gmail.com|password|
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |
	Given the following tags exist:
		|name|
		|testtag1|
		|testtag2|

Scenario: creating a new admin project
	Given I am on the admin dashboard
	When I follow "Projects"
	Then I should be on the admin projects page
	When I follow "New Project"
	And I fill in the following:
		|Title|adminproject|
		|Description|admins rock|
		|Owner|admin|

	#And I select "2000" from "Year"
	And I select "June" from "Month"
	And I select "1" from "Day"
	And I check "testtag1"
	And I press "Create Project"
	Then I should be on the admin project page for adminproject
	And I should see "Project was successfully created."
	And I should see "testtag1"

Scenario: Viewing admin project attributes
	Given I am on the admin projects page
	When I follow View for admin project Project4
	Then I should be on the admin project page for Project4
	And I should see "Fake Person 1"

Scenario: editing an admin project
	Given I am on the admin projects page
	When I follow Edit for admin project Project4
	Then I should be on the edit admin project page for Project4
	When I fill in the following:
		|Title|adminproject|
		|Description|admins rock|
		|Owner|admin|
	
	#And I select "2000" from "Year"
	And I select "June" from "Month"
	And I select "1" from "Day"
	And I check "testtag1"
	And I press "Update Project"
	Then I should be on the admin project page for adminproject
	And I should see "Project was successfully updated."
	And I should see "testtag1"

Scenario: deleting an admin project
	Given I am on the admin projects page
	When I follow Delete for admin project Project4
	Then I should be on the admin projects page
	And I should see "Project was successfully destroyed"
	And I should not see "Project4"
