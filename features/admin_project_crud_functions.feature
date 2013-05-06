Feature: CRUD functions for admins on projects

As a website administrator
So I can regulate the projects on the website
I wish to implement crud functions for projects

Background:
	Given the test users exist
	Given the test projects exist
	Given the test admins exist
	Given the test tags exist
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |

#Admin can not make new projects from admin page

Scenario: Viewing admin project attributes
	Given I am on the admin projects page
	When I follow View for admin project Project4
	Then I should be on the admin project page for Project4
	And I should see "testuser1"

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
