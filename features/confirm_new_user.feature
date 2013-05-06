Feature: Confirm newly registered users to the website

As a website owner
In order to regulate the users that are allowed on the website
I want to confirm or deny newly registered users

Background:

Given the test users exist
	Given the test projects exist
	Given the test admins exist
	Given the test tags exist
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |

Scenario: Newly registered user can not log in
	Given I am on the register new user page
	And I register unconfirmed users
	Then I should be on the home page
	When I follow "Login"
	And I fill in the following:
		|user_login|testman|
		|user_password|password|
	And I press "Sign in"
	Then I should be on the login page
	And I am not signed in

Scenario: A user can login once confirmed
	Given I am on the register new user page
	And I register unconfirmed users
	When the user testman gets confirmed
	And I go to the login page
	And I fill in the following:
		|user_login|testman|
		|user_password|password|
	And I press "Sign in"
	Then I should be on the home page
	And I should be signed in as testman

Scenario: Confirming/denying an admin user via admin user index page
	Given I register unconfirmed users
	When I go to the admin users page
	Then I should see "testfirst"
	And I should see "test2first"
	And I should see "Confirm"
	And I should see "Deny"
	When I follow Confirm for admin user testman2
	Then I should be on the admin users page
	And I should see "testfirst"
	And I should see CONFIRMED for admin user testman2
	When I follow Deny for admin user testman
	Then I should be on the admin users page
	And I should not see "testfirst"

Scenario: Confirming/denying an admin user via admin user page
	Given I register unconfirmed users
	When I go to the admin user page for testman2
	Then I should see "Confirm"
	And I should see "Deny"
	When I follow "Confirm"
	Then I should be on the admin user page for testman2
	And I should see "CONFIRMED"
	When I go to the admin user page for testman
	Then I should see "Deny"
	When I follow "Deny"
	Then I should be on the admin users page
	And I should not see "testfirst"
	
Scenario: An unconfirmed user should not appear on the users index
	Given I register unconfirmed users
	And I am signed in as the following authenticated user
		|username |firstname |lastname |email          |password|password_confirmation|
		|testuser1|user1first|user1last|user1@gmail.com|password|password             |
	When I go to the users page
	Then I should not see "testfirst"
	And I should not see "test2first"


	
	
		
	
