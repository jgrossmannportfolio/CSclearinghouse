Feature: CRUD functions for admins on users

As a website administrator
So I can regulate the users to the website
I wish to implement crud functions for users

Background:
	Given the test users exist
	Given the test admins exist
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |

#No create user for admins

Scenario: Viewing user attributes
	Given I am on the admin users page
	When I follow View for admin user testuser1
	Then I should be on the admin user page for testuser1
	And I should see "user1@gmail.com"

Scenario: editing an admin user
	Given I am on the admin users page
	When I follow Edit for admin user testuser1
	Then I should be on the edit admin user page for testuser1
	When I fill in the following:
		|Firstname|testeditfirst|
		|Lastname|testeditlast|
	And I press "Update User"
	Then I should be on the admin user page for testuser1
	And I should see "User was successfully updated."
	And I should see "testeditfirst"
	And I should see "testeditlast"

Scenario: deleting an admin user
	Given I am on the admin users page
	When I follow Delete for admin user testuser2
	Then I should be on the admin users page
	And I should see "User was successfully destroyed."
	And I should not see "testuser2"
