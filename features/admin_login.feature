Feature: login as an admin

As a website owner or operator
In order to moderate the website activity and function
I wish to be able to sign in as an administrator

Background:
	Given the following users exist:
		| username | firstname | lastname | email           | password | password_confirmation|
		|testuser1 |user1first |user1last |user1@gmail.com  | password | password             |
		|testuser2 |user2first |user2last |user2@colgate.edu| password | password             |
		|testuser3 |user3first |user3last |user3@yahoo.com  | password | password             |
	Given the following admins exist:
		|	email							|password|
		|testadmin@gmail.com|password|

Scenario: Logging in as admin
	Given I am not logged in as an admin
	And I am on the admin login page
	When I fill in the following:
		|admin_user_login|testadmin@gmail.com|
		|admin_user_password|password|
	And I press "Login"
	Then I should be on the admin dashboard
	And I should be logged in as an admin
	
