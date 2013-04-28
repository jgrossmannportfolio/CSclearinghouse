Feature: logout as an admin

As a website owner or operator
In order to protect administrative powers
I wish to be able to sign out as an administrator

Background:
	Given the following users exist:
		| username | firstname | lastname | email           | password | password_confirmation|
		|testuser1 |user1first |user1last |user1@gmail.com  | password | password             |
		|testuser2 |user2first |user2last |user2@colgate.edu| password | password             |
		|testuser3 |user3first |user3last |user3@yahoo.com  | password | password             |
	Given the following admins exist:
		|	email							|password|
		|testadmin@gmail.com|password|
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |

Scenario: Logging out as admin
	Given I am logged in as an admin
	And I am on the admin dashboard
	When I follow "Logout"
	Then I should be on the admin login page
	And I should not be logged in as an admin
	
