Feature: logout as an admin

As a website owner or operator
In order to protect administrative powers
I wish to be able to sign out as an administrator

Background:
	Given the test users exist
	Given the test admins exist
	Given I am logged in as the following authenticated admin:
		|email 							|password |
		|testadmin@gmail.com|password |

Scenario: Logging out as admin
	Given I am logged in as an admin
	And I am on the admin dashboard
	When I follow "Logout"
	Then I should be on the admin login page
	And I should not be logged in as an admin
	
