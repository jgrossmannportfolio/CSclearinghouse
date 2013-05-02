Feature: login as an admin

As a website owner or operator
In order to moderate the website activity and function
I wish to be able to sign in as an administrator

Background:
	Given the test users exist
	Given the test admins exist

Scenario: Logging in as admin
	Given I am not logged in as an admin
	And I am on the admin login page
	When I fill in the following:
		|admin_user_login|testadmin@gmail.com|
		|admin_user_password|password|
	And I press "Login"
	Then I should be on the admin dashboard
	And I should be logged in as an admin
	
