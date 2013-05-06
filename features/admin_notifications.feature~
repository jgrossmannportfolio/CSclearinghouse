Feature: create notifications for administrators

As a site administrator
so that I can efficiently run the website
I wish to receive notifications of important events

Background:
	Given the test users exist
	Given the test projects exist
	Given the test admins exist
	Given the test tags exist
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |

Scenario: new user sends a notification to admin to confirm or deny 
	Given I register unconfirmed users
	When I go to the admin dashboard
	Then I should see "testfirst"
	And I should see "test2first"
	And I should see "Confirm"
	And I should see "Deny"
	When I Confirm the admin user notification for testman
	Then I should be on the admin dashboard
	And I should not see "testfirst"
	When I Deny the admin user notification for testman2
	Then I should be on the admin dashboard
	And I should not see "test2first"

Scenario: new project sends a notification to admin to confirm or deny
	Given I am signed in as the following authenticated user:
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |
	Given I create unconfirmed projects
	When I go to the admin dashboard
	Then I should see "testproject"
	And I should see "test2project"
	And I should see "Confirm"
	And I should see "Deny"
	When I Confirm the admin project notification for testproject
	Then I should be on the admin dashboard
	And I should not see "testproject"
	When I Deny the admin project notification for test2project
	Then I should be on the admin dashboard
	And I should not see "test2project"
	
	
	
