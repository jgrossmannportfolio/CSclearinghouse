Feature: Confirm or deny newly created projects

As a website owner
In order to regulate the projects that are allowed on the website
I want to confirm or deny newly created projects

Background:

	Given the test users exist
	Given the test projects exist
	Given the test admins exist
	Given the test tags exist
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |
	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |


Scenario: Confirming/denying an admin project via admin project index page
	Given I create unconfirmed projects
	When I go to the admin projects page
	Then I should see "testproject"
	And I should see "test2project"
	And I should see "Confirm"
	And I should see "Deny"
	When I follow Confirm for admin project testproject
	Then I should be on the admin projects page
	And I should see "testproject"
	And I should see CONFIRMED for admin project testproject
	When I follow Deny for admin project test2project
	Then I should be on the admin projects page
	And I should not see "test2project"

Scenario: Confirming/denying an admin project via admin project page
	Given I create unconfirmed projects
	When I go to the admin project page for testproject
	Then I should see "Confirm"
	And I should see "Deny"
	When I follow "Confirm"
	Then I should be on the admin project page for testproject
	And I should see "CONFIRMED"
	When I go to the admin project page for test2project
	Then I should see "Deny"
	When I follow "Deny"
	Then I should be on the admin projects page
	And I should not see "test2project"
	
Scenario: An unconfirmed project should not appear on the projects index
	Given I create unconfirmed projects
	When I go to the projects page
	Then I should not see "testproject"
	And I should not see "test2project"
